namespace :bill do
  
  desc "月末請求データ挿入&メール配信"
  
  # 実行時の前の月の請求レコードを更新する
  # 毎月2日に実行
  task :update => :environment do
    exit if Time.zone.now.strftime("%d").to_i == 2
    target = Time.zone.now - 1.month
    Owner.all.each do |owner|
      total_amount = 0
      bill = owner.bills.where(year: target.year, month: target.month).first
      next if bill.nil?
      bill.bill_details.each do |detail|
        continue_moving_count = 0
        days_count = 0
        detail.house.rooms.each do |room|
          next if room.moved_at.nil? || room.leave_at && (room.leave_at <= target.beginning_of_month)
          moving_start = room.moved_at <= target.beginning_of_month ? target.beginning_of_month : room.moved_at
          leave_end = room.leave_at.nil? ? target.end_of_month : room.leave_at
          if moving_start == target.beginning_of_month && target.end_of_month == leave_end
            # 継続して入居している場合
            continue_moving_count += 1
          else
            # 日割り計算を行う日数
            days_count += leave_end.day - moving_start.day + 1
          end
        end
        # 日割り計算用の一日当たりの金額
        day_amount = detail.house.price.to_f / target.end_of_month.day
        
        detail.update!(
          moving_count: continue_moving_count,
          moving_amount: continue_moving_count * detail.house.price,
          days_amount: (days_count * day_amount).to_i,
          total_amount: continue_moving_count * detail.house.price + (days_count * day_amount).to_i
        )
        
        total_amount += detail.total_amount
      end
      bill.update!(amount: total_amount)
    end
  end
  
  desc "請求レコード作成"
  #毎月25日に実行
  # 実行月の次の月の請求レコードを作成
  task :create => :environment do
    exit if Time.zone.now.strftime("%d").to_i == 25
    current_date = Time.zone.now
    next_year = (current_date + 1.month).strftime("%Y").to_i
    next_month = (current_date + 1.month).strftime("%m").to_i
    Owner.all.each do |owner|
      bill = Bill.create!(owner_id: owner.id, year: next_year, month: next_month)
      owner.houses.each do |house|
        BillDetail.create!(bill_id: bill.id, house_id: house.id)
      end
    end
  end
end