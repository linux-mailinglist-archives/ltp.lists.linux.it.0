Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1971898A2
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 10:56:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C02C3C551E
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 10:56:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 83A303C5510
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 10:56:07 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C4BBC1A016D0
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 10:56:03 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,566,1574092800"; d="scan'208";a="86536780"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 17:56:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id CD81C406AB15;
 Wed, 18 Mar 2020 17:45:51 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 17:55:54 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20200224153112.GB2210@rei>
 <1582879661-1951-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200317123203.GA21921@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <aae4670a-74eb-36e7-6115-b41eff951405@cn.fujitsu.com>
Date: Wed, 18 Mar 2020 17:55:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200317123203.GA21921@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: CD81C406AB15.AEBFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/add_key05: add maxbytes/maxkeys test
 under unprivileged user
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr


> Hi Xu,
> 
> thanks for your patch.
> 
>> This case is designed to test whether we can reach maxbytes/maxkeys
>> quota exactly under unprivileged users. It is a regression test for
>> commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly").
>> But this kenrel commit is a incomplete fix, it still fails on 5.6.3-rc1.
>> Fix patch[1] is still under review.
> 
>> [1]https://patchwork.kernel.org/patch/11411507/
> It's already in next tree, congratulations :).
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200317&id=2e356101e72ab1361821b3af024d64877d9a798d
Thanks.
> 
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>> v1->v2:
>> 1. using parse_proc_key_user
>> 2. add some messages about delta(v1 uses data_len)
>> 3. fix something pointed by Cyril
> ...
> 
>> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
>> @@ -0,0 +1,211 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> + *
>> + *Description:
> Few formatting like comments (sorry for pointing out unimportant nits, but with
> little care it can be avoided, of course this can be fixed by person who merges):
> nit: missing space after *. I also tend to avoid text like "Description"
> (it's obvious it's a description).

Right, I will remove "Description:".
>> + * Test unprivileged user can support the number of keys and the
>> + * number of bytes consumed in payloads of the keys.The defalut value
> nit: missing space after dot.
> 
>> + * is 200 and 20000.
>> + * This is also a regresstion test for
>> + * commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
> It's not bad to mention this commit, but maybe not needed since there is
> linux-git tag.
I prefer to keep it, it is more clear for user.
>> + *
> Why extra line with * ?
I will remove it.
>> + */
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <pwd.h>
>> +#include "tst_test.h"
>> +#include "lapi/keyctl.h"
>> +
>> +static char *user_buf;
>> +static const char *username = "ltp_add_key05";
>> +static int user_added;
>> +struct passwd *ltpuser;
>> +static char fmt[1024];
>> +
>> +static void add_user(void)
>> +{
>> +	if (user_added)
>> +		return;
>> +
>> +	const char *const cmd_useradd[] = {"useradd", username, NULL};
>> +	int rc;
>> +
>> +	switch ((rc = tst_run_cmd(cmd_useradd, NULL, NULL, 1))) {
>> +	case 0:
>> +		user_added = 1;
>> +		ltpuser = SAFE_GETPWNAM(username);
>> +		break;
>> +	case 1:
>> +	case 255:
>> +		break;
>> +	default:
>> +		tst_brk(TBROK, "Useradd failed (%d)", rc);
>> +	}
>> +	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
>> +}
> I've been planning to add functionality like this to the library for some time.
> (there is identical code in setpriority01.c and other tests would benefit from that).
> But no need to stop this patch just for this, I've created issue for it:
> https://github.com/linux-test-project/ltp/issues/468
> 
That't great.
>> +
>> +static void clean_user(void)
>> +{
>> +	if (!user_added)
>> +		return;
>> +
>> +	const char *const cmd_userdel[] = {"userdel", "-r", username, NULL};
>> +
>> +	if (tst_run_cmd(cmd_userdel, NULL, NULL, 1))
>> +		tst_res(TWARN | TERRNO, "'userdel -r %s' failed", username);
>> +	else
>> +		user_added = 0;
>> +}
>> +
>> +static inline void parse_proc_key_users(int *used_key, int *max_key, int *used_bytes, int *max_bytes)
>> +{
>> +	unsigned int val[4];
>> +	SAFE_FILE_LINES_SCANF("/proc/key-users", fmt, &val[0], &val[1], &val[2], &val[3]);
>> +
>> +	if (used_key)
>> +		*used_key = val[0];
>> +	if (max_key)
>> +		*max_key = val[1];
>> +	if (used_bytes)
>> +		*used_bytes = val[2];
>> +	if (max_bytes)
>> +		*max_bytes = val[3];
>> +}
>> +
>> +static void verify_max_btyes(void)
>> +{
>> +	char *buf;
>> +	int plen, invalid_plen, delta;
>> +	int used_bytes, max_bytes, tmp_used_bytes;
>> +
>> +	tst_res(TINFO, "test max bytes under unprivileged user");
>> +
>> +	parse_proc_key_users(NULL, NULL, &tmp_used_bytes, NULL);
>> +	TEST(add_key("user", "test2", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET == -1) {
>> +		tst_res(TFAIL | TTERRNO, "add key test2 failed");
>> +		return;
>> +	}
>> +	parse_proc_key_users(NULL, NULL, &used_bytes, &max_bytes);
>> +
>> +	/*
>> +	 * Compute delta between default datalen(in key_alloc) and actual
>> +	 * datlen(in key_payload_reserve).
>> +	 * more info see kernel code: security/keys/key.c
>> +	 */
>> +	delta = used_bytes - tmp_used_bytes - strlen("test2") - 1 - 64;
>> +	invalid_plen = max_bytes - used_bytes - delta - strlen("test_xxx");
>> +	buf = tst_alloc(invalid_plen);
>> +
>> +	TEST(add_key("user", "test_inv", buf, invalid_plen, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET != -1) {
>> +		tst_res(TFAIL, "add_key(test_inv) succeeded unexpectedltly");
>> +		return;
>> +	}
>> +	if (TST_ERR == EDQUOT)
>> +		tst_res(TPASS | TTERRNO, "add_key(test_inv) failed as expected");
>> +	else
>> +		tst_res(TFAIL | TTERRNO, "add_key(test_inv) failed expected EDQUOT got");
>> +
>> +	/*Reset delta*/
>> +	TEST(add_key("user", "test3", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET == -1) {
>> +		tst_res(TFAIL | TTERRNO, "add key test3 failed");
>> +		return;
>> +	}
>> +	TEST(add_key("user", "test4", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET == -1) {
>> +		tst_res(TFAIL | TTERRNO, "add key test4 failed");
>> +		return;
>> +	}
>> +	parse_proc_key_users(NULL, NULL, &used_bytes, &max_bytes);
>> +	plen = max_bytes - used_bytes - delta - strlen("test_xxx") - 1;
>> +	TEST(add_key("user", "test_max", buf, plen, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET == -1) {
>> +		 tst_res(TFAIL | TTERRNO, "add_key(test_max) failed unexpectedly");
>> +		 return;
> Hm, I get this failure, I guess both are because missing your fix
> 2e356101e72ab1361821b3af024d64877d9a798d, right?
Yes, if your kernel is only with commit ("KEYS: allow reaching the keys 
quotas exact"), add_key(test_max) will fail because we don't remove this 
limit when initializing the key.
> 
> add_key05.c:106: PASS: add_key(test_inv) failed as expected: EDQUOT (122)
> add_key05.c:125: FAIL: add_key(test_max) failed unexpectedly: EDQUOT (122)
> no crontab for ltp_add_key05
> userdel: ltp_add_key05 home directory (/home/ltp_add_key05) not found
> 
> Tested on tmpfs and ext4 on openSUSE (5.5.7-1-default):
> 
> Mar 17 12:54:52 dell5510 useradd[28122]: new user: name=ltp_add_key05, UID=1001, GID=100, home=/home/ltp_add_key05, shell=/bin/bash, from=/dev/pts/3
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was written to
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was moved into place, adding watch
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/group` was written to
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (35)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (35)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 crontab[28135]: (root) DELETE (ltp_add_key05)
> Mar 17 12:54:52 dell5510 userdel[28133]: delete user 'ltp_add_key05'
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was written to
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was moved into place, adding watch
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/group` was written to
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (36)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (36)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 useradd[28145]: new user: name=ltp_add_key05, UID=1001, GID=100, home=/home/ltp_add_key05, shell=/bin/bash, from=/dev/pts/3
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was written to
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was moved into place, adding watch
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitored file `/etc/group` was written to
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (37)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:52 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (37)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:53 dell5510 crontab[28158]: (root) DELETE (ltp_add_key05)
> Mar 17 12:54:53 dell5510 userdel[28156]: delete user 'ltp_add_key05'
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was written to
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitored file `/etc/passwd` was moved into place, adding watch
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitored file `/etc/group` was written to
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (38)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring file `/etc/passwd` (38)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring file `/etc/group` (3)
> Mar 17 12:54:53 dell5510 nscd[1781]: 1781 monitoring directory `/etc` (2)
> 
> Also failed on Debian (5.3.0-rc3+)
> add_key05.c:82: INFO: test max bytes under unprivileged user
> add_key05.c:107: PASS: add_key(test_inv) failed as expected: EDQUOT (122)
> add_key05.c:126: FAIL: add_key(test_max) failed unexpectedly: EDQUOT (122)
> userdel: ltp_add_key05 mail spool (/var/mail/ltp_add_key05) not found
> userdel: ltp_add_key05 home directory (/home/ltp_add_key05) not found
> 
> Mar 17 11:58:32 debian-testing useradd[969]: new group: name=ltp_add_key05, GID=1002
> Mar 17 11:58:32 debian-testing useradd[969]: new user: name=ltp_add_key05, UID=1002, GID=1002, home=/home/ltp_add_key05, shell=
> Mar 17 11:58:32 debian-testing userdel[975]: delete user 'ltp_add_key05'
> Mar 17 11:58:32 debian-testing userdel[975]: removed group 'ltp_add_key05' owned by 'ltp_add_key05'
> Mar 17 11:58:32 debian-testing userdel[975]: removed shadow group 'ltp_add_key05' owned by 'ltp_add_key05'
> Mar 17 11:58:32 debian-testing useradd[980]: new group: name=ltp_add_key05, GID=1002
> Mar 17 11:58:32 debian-testing useradd[980]: new user: name=ltp_add_key05, UID=1002, GID=1002, home=/home/ltp_add_key05, shell=
> Mar 17 11:58:32 debian-testing userdel[986]: delete user 'ltp_add_key05'
> Mar 17 11:58:32 debian-testing userdel[986]: removed group 'ltp_add_key05' owned by 'ltp_add_key05'
> Mar 17 11:58:32 debian-testing userdel[986]: removed shadow group 'ltp_add_key05' owned by 'ltp_add_key05'
> 
> The rest looks ok to me.
Thanks for your reivew. I will send v3 (also add save_store for keys/btyes )

Best Regards
Yang Xu
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
