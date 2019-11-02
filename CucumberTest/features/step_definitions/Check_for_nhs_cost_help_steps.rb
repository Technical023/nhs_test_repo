Given(/^I am a person from Wales$/) do
@checking_my_circumstance = @basePage.visit_home_page
end

When (/^I put my circumstances into the checker tools$/) do
 @assert_help_type = @checking_my_circumstance
      .select_start_button
        .select_your_country
          .select_next_button
          .enter_dob(28, 12,1979)
            .select_next_to_continue
               .select_partner_yes_or_no
                 .select_next_button
                    .do_you_or_partner_collect_benefit
                      .are_you_pregnant_or_given_birth
                        .select_next_to_progress
                        .had_injury_before_?
                         .had_diabetes?
                          .had_glaucoma?
                           .live_at_home_or_care_home
                             .select_next_button
                               .select_you_and_partner_income
                                 .select_next_button3
end

Then(/^I should get a result of whether I should get help or not$/) do
  first_help = ('Find out more')
  expect(@assert_help_type.assert_help_type(first_help)).to be true
# expect(@assert_help_type.assert_help_type('FREE_PRESCRIPTION')).to be true
end