Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53716E462D
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 10:50:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A3DB3C2292
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 10:50:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EBEB73C2274
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 10:50:04 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9C37414002A7
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 10:50:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,228,1569254400"; d="scan'208";a="77467458"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 16:49:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 769C44CE1507;
 Fri, 25 Oct 2019 16:42:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 25 Oct 2019 16:49:59 +0800
To: Jan Kara <jack@suse.cz>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1571821231-3846-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191024082525.GK31271@quack2.suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7a9b715d-d220-f040-14a2-8967dcc4f002@cn.fujitsu.com>
Date: Fri, 25 Oct 2019 16:49:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191024082525.GK31271@quack2.suse.cz>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 769C44CE1507.AFA36
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/6] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
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



on 2019/10/24 16:25, Jan Kara wrote:
> On Wed 23-10-19 17:00:28, Yang Xu wrote:
>> Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
>> same as Q_GETQUOTA, but it returns quota information for the next ID
>> greater than or equal to id that has a quota set.
>>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> 
> I was thinking about how much these tests are actually needed. The thing is
> that fstests have also quota tests. And as part of these tests we do run
> e.g. repquota(8) and verify its output and that uses Q_GETNEXTQUOTA inside.
> So Q_GETNEXTQUOTA gets testing as part of fstests. On the other hand
> fstests are focused on testing the general quota functionality as user
> would use it so we don't really try to make sure all quotactl calls are
> covered. So there's still some value in low level testing of each
> quotactl like you do here.

IMO, fstests tests quota more deeply and it coverS more user scenes(also 
  some regresstion tests). But in ltp, in syscalls/quotactl, I try my 
best to test various subcmds (it may stay in API level but not actual 
quota actions) and three quota types(user,group,project).

In addition, I am writing quotactl error tests as man-pages mentioned.
> 
> 								Honza
> 
>> ---
>>   include/lapi/quotactl.h                       | 23 ++---
>>   m4/ltp-quota.m4                               | 36 +-------
>>   .../kernel/syscalls/quotactl/quotactl01.c     | 86 ++++++++++++-------
>>   3 files changed, 67 insertions(+), 78 deletions(-)
>>
>> diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
>> index 729472f69..99f4e5fc5 100644
>> --- a/include/lapi/quotactl.h
>> +++ b/include/lapi/quotactl.h
>> @@ -1,26 +1,21 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>> - * Copyright (c) 2017 Fujitsu Ltd.
>> + * Copyright (c) 2016-2019 FUJITSU LIMITED. All rights reserved.
>>    * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
>> - *
>> - * This program is free software: you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation, either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> - * GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program. If not, see <http://www.gnu.org/licenses/>.
>> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
>>    */
>>   
>>   #ifndef LAPI_QUOTACTL_H__
>>   # define LAPI_QUOTACTL_H__
>>   
>> +#include <linux/quota.h>
>> +
>>   # ifndef Q_XGETNEXTQUOTA
>>   #  define Q_XGETNEXTQUOTA XQM_CMD(9)
>>   # endif
>>   
>> +# ifndef Q_GETNEXTQUOTA
>> +#  define Q_GETNEXTQUOTA 0x800009 /* get disk limits and usage >= ID */
>> +# endif
>> +
>>   #endif /* LAPI_QUOTACTL_H__ */
>> diff --git a/m4/ltp-quota.m4 b/m4/ltp-quota.m4
>> index c5e233ca1..964c34925 100644
>> --- a/m4/ltp-quota.m4
>> +++ b/m4/ltp-quota.m4
>> @@ -1,39 +1,7 @@
>>   dnl SPDX-License-Identifier: GPL-2.0-or-later
>>   dnl Copyright (c) Cisco Systems, Inc, 2008
>> +dnl Copyright (c) 2019 Fujitsu Ltd.
>>   
>>   AC_DEFUN([LTP_CHECK_SYSCALL_QUOTACTL],[
>> -	AC_LINK_IFELSE([AC_LANG_SOURCE([
>> -#define _LINUX_QUOTA_VERSION 2
>> -#include <sys/types.h>
>> -#include <sys/quota.h>
>> -#include <unistd.h>
>> -int main(void) {
>> -	struct dqblk dq;
>> -	return quotactl(QCMD(Q_GETINFO, USRQUOTA), (const char *) "/dev/null",
>> -			geteuid(), (caddr_t) &dq);
>> -}])],[has_quotav2="yes"])
>> -
>> -if test "x$has_quotav2" = xyes; then
>> -	AC_DEFINE(HAVE_QUOTAV2,1,[Define to 1 if you have quota v2])
>> -else
>> -
>> -	# got quota v1?
>> -	AC_LINK_IFELSE([AC_LANG_SOURCE([
>> -#define _LINUX_QUOTA_VERSION 1
>> -#include <sys/types.h>
>> -#include <sys/quota.h>
>> -#include <unistd.h>
>> -int main(void) {
>> -	struct dqblk dq;
>> -	return quotactl(QCMD(Q_GETQUOTA, USRQUOTA), (const char *) "/dev/null",
>> -			geteuid(), (caddr_t) &dq);
>> -}])],[has_quotav1="yes"])
>> -
>> -	if test "x$has_quotav1" = xyes; then
>> -		AC_DEFINE(HAVE_QUOTAV1,1,[Define to 1 if you have quota v1])
>> -	else
>> -		AC_MSG_WARN(Couldn't determine quota version (please submit config.log and manpage to ltp@lists.linux.it))
>> -	fi
>> -
>> -fi
>> +AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
>>   ])
>> diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
>> index b0be525d6..af78646e4 100644
>> --- a/testcases/kernel/syscalls/quotactl/quotactl01.c
>> +++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>>   * Copyright (c) Crackerjack Project., 2007
>> -* Copyright (c) 2016 Fujitsu Ltd.
>> +* Copyright (c) 2016-2019 FUJITSU LIMITED. All rights reserved
>>   * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
>>   *
>>   * This testcase checks the basic flag of quotactl(2) for non-XFS filesystems:
>> @@ -16,19 +16,23 @@
>>   *    flag for user.
>>   * 6) quotactl(2) succeeds to get quota format with Q_GETFMT flag for user.
>>   * 7) quotactl(2) succeeds to update quota usages with Q_SYNC flag for user.
>> -* 8) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for user.
>> -* 9) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for group.
>> -* 10) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
>> +* 8) quotactl(2) succeeds to get disk quota limit greater than or equal to
>> +*    ID with Q_GETNEXTSTAT flag for user.
>> +* 9) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for user.
>> +* 10) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for group.
>> +* 11) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
>>   *     for group.
>> -* 11) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
>> +* 12) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
>>   *     for group.
>> -* 12) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
>> +* 13) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
>>   *     flag for group.
>> -* 13) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
>> +* 14) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
>>   *     flag for group.
>> -* 14) quotactl(2) succeeds to get quota format with Q_GETFMT flag for group.
>> -* 15) quotactl(2) succeeds to update quota usages with Q_SYNC flag for group.
>> -* 16) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for group.
>> +* 15) quotactl(2) succeeds to get quota format with Q_GETFMT flag for group.
>> +* 16) quotactl(2) succeeds to update quota usages with Q_SYNC flag for group.
>> +* 17) quotactl(2) succeeds to get disk quota limit greater than or equal to
>> +*     ID with Q_GETNEXTSTAT flag for group.
>> +* 18) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for group.
>>   */
>>   
>>   #include <errno.h>
>> @@ -36,10 +40,9 @@
>>   #include <unistd.h>
>>   #include <stdio.h>
>>   #include "config.h"
>> -
>> +#include <sys/quota.h>
>>   #include "tst_test.h"
>> -
>> -# include <sys/quota.h>
>> +#include "lapi/quotactl.h"
>>   
>>   #  define QFMT_VFS_V0     2
>>   #  define USRPATH MNTPOINT "/aquota.user"
>> @@ -63,6 +66,10 @@ static struct dqinfo set_qf = {
>>   static struct dqinfo res_qf;
>>   static int32_t fmt_buf;
>>   
>> +#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
>> +static struct if_nextdqblk res_ndq;
>> +#endif
>> +
>>   static struct tcase {
>>   	int cmd;
>>   	int *id;
>> @@ -70,60 +77,73 @@ static struct tcase {
>>   	void *set_data;
>>   	void *res_data;
>>   	int sz;
>> +	int nflag;
>>   	char *des;
>>   } tcases[] = {
>>   	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH,
>> -	NULL, NULL, 0, "turn on quota for user"},
>> +	NULL, NULL, 0, 0, "turn on quota for user"},
>>   
>>   	{QCMD(Q_SETQUOTA, USRQUOTA), &test_id, &set_dq,
>> -	NULL, NULL, 0, "set disk quota limit for user"},
>> +	NULL, NULL, 0, 0, "set disk quota limit for user"},
>>   
>>   	{QCMD(Q_GETQUOTA, USRQUOTA), &test_id, &res_dq,
>>   	&set_dq.dqb_bsoftlimit, &res_dq.dqb_bsoftlimit,
>> -	sizeof(res_dq.dqb_bsoftlimit), "get disk quota limit for user"},
>> +	sizeof(res_dq.dqb_bsoftlimit), 0, "get disk quota limit for user"},
>>   
>>   	{QCMD(Q_SETINFO, USRQUOTA), &test_id, &set_qf,
>> -	NULL, NULL, 0, "set information about quotafile for user"},
>> +	NULL, NULL, 0, 0, "set information about quotafile for user"},
>>   
>>   	{QCMD(Q_GETINFO, USRQUOTA), &test_id, &res_qf,
>> -	&set_qf.dqi_bgrace, &res_qf.dqi_bgrace, sizeof(res_qf.dqi_bgrace),
>> +	&set_qf.dqi_bgrace, &res_qf.dqi_bgrace, sizeof(res_qf.dqi_bgrace), 0,
>>   	"get information about quotafile for user"},
>>   
>>   	{QCMD(Q_GETFMT, USRQUOTA), &test_id, &fmt_buf,
>> -	&fmt_id, &fmt_buf, sizeof(fmt_buf),
>> +	&fmt_id, &fmt_buf, sizeof(fmt_buf), 0,
>>   	"get quota format for user"},
>>   
>>   	{QCMD(Q_SYNC, USRQUOTA), &test_id, &res_dq,
>> -	NULL, NULL, 0, "update quota usages for user"},
>> +	NULL, NULL, 0, 0, "update quota usages for user"},
>> +
>> +#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
>> +	{QCMD(Q_GETNEXTQUOTA, USRQUOTA), &test_id, &res_ndq,
>> +	&test_id, &res_ndq.dqb_id, sizeof(res_ndq.dqb_id), 1,
>> +	"get next disk quota limit for user"},
>> +#endif
>>   
>>   	{QCMD(Q_QUOTAOFF, USRQUOTA), &test_id, USRPATH,
>> -	NULL, NULL, 0, "turn off quota for user"},
>> +	NULL, NULL, 0, 0, "turn off quota for user"},
>>   
>>   	{QCMD(Q_QUOTAON, GRPQUOTA), &fmt_id, GRPPATH,
>> -	NULL, NULL, 0, "turn on quota for group"},
>> +	NULL, NULL, 0, 0, "turn on quota for group"},
>>   
>>   	{QCMD(Q_SETQUOTA, GRPQUOTA), &test_id, &set_dq,
>> -	NULL, NULL, 0, "set disk quota limit for group"},
>> +	NULL, NULL, 0, 0, "set disk quota limit for group"},
>>   
>>   	{QCMD(Q_GETQUOTA, GRPQUOTA), &test_id, &res_dq, &set_dq.dqb_bsoftlimit,
>> -	&res_dq.dqb_bsoftlimit, sizeof(res_dq.dqb_bsoftlimit),
>> +	&res_dq.dqb_bsoftlimit, sizeof(res_dq.dqb_bsoftlimit), 0,
>>   	"set disk quota limit for group"},
>>   
>>   	{QCMD(Q_SETINFO, GRPQUOTA), &test_id, &set_qf,
>> -	NULL, NULL, 0, "set information about quotafile for group"},
>> +	NULL, NULL, 0, 0, "set information about quotafile for group"},
>>   
>>   	{QCMD(Q_GETINFO, GRPQUOTA), &test_id, &res_qf, &set_qf.dqi_bgrace,
>> -	&res_qf.dqi_bgrace, sizeof(res_qf.dqi_bgrace),
>> +	&res_qf.dqi_bgrace, sizeof(res_qf.dqi_bgrace), 0,
>>   	"get information about quotafile for group"},
>>   
>>   	{QCMD(Q_GETFMT, GRPQUOTA), &test_id, &fmt_buf,
>> -	&fmt_id, &fmt_buf, sizeof(fmt_buf), "get quota format for group"},
>> +	&fmt_id, &fmt_buf, sizeof(fmt_buf), 0, "get quota format for group"},
>>   
>>   	{QCMD(Q_SYNC, GRPQUOTA), &test_id, &res_dq,
>> -	NULL, NULL, 0, "update quota usages for group"},
>> +	NULL, NULL, 0, 0, "update quota usages for group"},
>> +
>> +#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
>> +	{QCMD(Q_GETNEXTQUOTA, GRPQUOTA), &test_id, &res_ndq,
>> +	&test_id, &res_ndq.dqb_id, sizeof(res_ndq.dqb_id), 1,
>> +	"get next disk quota limit for group"},
>> +#endif
>>   
>>   	{QCMD(Q_QUOTAOFF, GRPQUOTA), &test_id, GRPPATH,
>> -	NULL, NULL, 0, "turn off quota for group"}
>> +	NULL, NULL, 0, 0, "turn off quota for group"}
>>   };
>>   
>>   static void setup(void)
>> @@ -156,9 +176,15 @@ static void verify_quota(unsigned int n)
>>   
>>   	res_dq.dqb_bsoftlimit = 0;
>>   	res_qf.dqi_igrace = 0;
>> +#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
>> +	res_ndq.dqb_id = -1;
>> +#endif
>>   	fmt_buf = 0;
>> -
>>   	TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
>> +	if (TST_ERR == ENOSYS && tc->nflag) {
>> +		tst_res(TCONF, "Current system doesn't support Q_GETNEXTQUOTA, it needs kernel>=4.6!");
>> +		return;
>> +	}
>>   	if (TST_RET == -1) {
>>   		tst_res(TFAIL | TTERRNO, "quotactl failed to %s", tc->des);
>>   		return;
>> -- 
>> 2.18.0
>>
>>
>>



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
