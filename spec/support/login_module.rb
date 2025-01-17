module LoginModule
  def login(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    click_button('ログイン')
  end
end
