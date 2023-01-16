Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA70566BC18
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Jan 2023 11:45:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AAA63CC901
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Jan 2023 11:45:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 43AED3CB4BA
 for <ltp@lists.linux.it>; Mon, 16 Jan 2023 11:45:44 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 90CCA600063
 for <ltp@lists.linux.it>; Mon, 16 Jan 2023 11:45:42 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 74DD3676BC
 for <ltp@lists.linux.it>; Mon, 16 Jan 2023 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673865942;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ppn+lJO9x+x6oQx3YVaKqCgUXoknmUhJ2eY3Viiv+E=;
 b=nLxmLbpUeCKKHJAIupvyEiGqeAQPAE7PSjcetXP9dfEPlBU7zfoVMXyhXIz6+OReayNvMs
 65Kanpwr7x8xEwpzIFxCIVOodXnAk1mnO88jq/5NkJTLbCxVaLmyfBbO19H9DZAbzGhXgz
 3EJ6WhZL+WUsw3kybBYN0RZNnIcEYVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673865942;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ppn+lJO9x+x6oQx3YVaKqCgUXoknmUhJ2eY3Viiv+E=;
 b=gTx1+kEltSon/0AULB7sPR7h5fHhIm1oJykORnmvTPzuc/EDobkedRsifidCXj9ZV527WE
 vAPvr38yA0Dtq5Ag==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 44CDD2C146;
 Mon, 16 Jan 2023 10:45:42 +0000 (UTC)
References: <20230111132550.15587-1-akumar@suse.de> <87pmbkhvuu.fsf@suse.de>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: rpalethorpe@suse.de
Date: Mon, 16 Jan 2023 10:42:57 +0000
Organization: Linux Private Site
In-reply-to: <87pmbkhvuu.fsf@suse.de>
Message-ID: <87sfgawyei.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setreuid04.c: Rewrite using new LTP API
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Richard Palethorpe <rpalethorpe@suse.de> writes:

> Hello,
>
> Avinesh Kumar <akumar@suse.de> writes:
>
>> Signed-off-by: Avinesh Kumar <akumar@suse.de>
>> ---
>>  .../kernel/syscalls/setreuid/setreuid04.c     | 158 +++++-------------
>>  1 file changed, 41 insertions(+), 117 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/setreuid/setreuid04.c b/testcases/kernel/syscalls/setreuid/setreuid04.c
>> index 8eed90df0..9c52ff1bd 100644
>> --- a/testcases/kernel/syscalls/setreuid/setreuid04.c
>> +++ b/testcases/kernel/syscalls/setreuid/setreuid04.c
>> @@ -1,141 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>  /*
>>   * Copyright (c) International Business Machines  Corp., 2001
>> - *
>> - * This program is free software;  you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - * the GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program;  if not, write to the Free Software
>> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> - *
>>   * Ported by John George
>> + * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
>>   */
>>  
>> -/*
>> - * Test that root can change the real and effective uid to an
>> - * unpriviledged user.
>> +/*\
>> + * [Description]
>> + *
>> + * Verify that root user can change the real and effective uid to an
>> + * unprivileged user.
>>   */
>>  
>> -#include <errno.h>
>> -#include <stdlib.h>
>>  #include <pwd.h>
>> -#include <sys/wait.h>
>> -
>> -#include "test.h"
>> -#include "compat_16.h"
>> -
>> -TCID_DEFINE(setreuid04);
>> +#include "tst_test.h"
>> +#include "compat_tst_16.h"
>>  
>>  static uid_t neg_one = -1;
>> +static uid_t root_uid, nobody_uid;
>>  
>> -static struct passwd nobody, root;
>> -
>> -/*
>> - * The following structure contains all test data.  Each structure in the array
>> - * is used for a separate test.  The tests are executed in the for loop below.
>> - */
>> -
>> -struct test_data_t {
>> +static struct tcase {
>>  	uid_t *real_uid;
>>  	uid_t *eff_uid;
>> -	struct passwd *exp_real_usr;
>> -	struct passwd *exp_eff_usr;
>> -	char *test_msg;
>> -} test_data[] = {
>> -	{
>> -	&neg_one, &neg_one, &root, &root, "After setreuid(-1, nobody),"}, {
>> -&nobody.pw_uid, &nobody.pw_uid, &nobody, &nobody,
>> -		    "After setreuid(-1, -1),"},};
>> -
>> -int TST_TOTAL = ARRAY_SIZE(test_data);
>> -
>> -static void setup(void);
>> -static void cleanup(void);
>> -static void uid_verify(struct passwd *, struct passwd *, char *);
>> -
>> -int main(int ac, char **av)
>> -{
>> -	int lc;
>> -
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -		int i, pid;
>> -
>> -		tst_count = 0;
>> -
>> -		if ((pid = FORK_OR_VFORK()) == -1) {
>> -			tst_brkm(TBROK, cleanup, "fork failed");
>> -		} else if (pid == 0) {	/* child */
>> -
>> -			for (i = 0; i < TST_TOTAL; i++) {
>> -
>> -				/* Set the real or effective user id */
>> -				TEST(SETREUID(cleanup, *test_data[i].real_uid,
>> -					      *test_data[i].eff_uid));
>> -
>> -				if (TEST_RETURN != -1) {
>> -					tst_resm(TPASS, "setreuid(%d, %d) "
>> -						 "succeeded as expected.",
>> -						 *test_data[i].real_uid,
>> -						 *test_data[i].eff_uid);
>> -				} else {
>> -					tst_resm(TFAIL, "setreuid(%d, %d) "
>> -						 "did not return as expected.",
>> -						 *test_data[i].real_uid,
>> -						 *test_data[i].eff_uid);
>> -				}
>> -
>> -				uid_verify(test_data[i].exp_real_usr,
>> -					   test_data[i].exp_eff_usr,
>> -					   test_data[i].test_msg);
>> -			}
>> -			tst_exit();
>> -		} else {	/* parent */
>> -			tst_record_childstatus(cleanup, pid);
>> -		}
>> -	}
>> -	cleanup();
>> -	tst_exit();
>> -}
>> +	uid_t *exp_real_uid;
>> +	uid_t *exp_eff_uid;
>> +} tcases[] = {
>> +	{&neg_one, &neg_one, &root_uid, &root_uid},
>> +	{&nobody_uid, &nobody_uid, &nobody_uid, &nobody_uid}
>> +};
>
> I think further cleanup is possible here. We only have one test case so
> we don't need this struct or an array. We certainly don't need a struct
> of pointers. We don't need constants like "neg_one".

Setting to changes requested in patchwork due to the above

>
> -- 
> Thank you,
> Richard.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
