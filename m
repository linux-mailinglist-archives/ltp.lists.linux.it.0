Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 782885FBF61
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 05:01:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6B573CAE97
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 05:01:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 52D8E3C04D1
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 05:01:18 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A781560086C
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 05:01:16 +0200 (CEST)
Received: from canpemm500008.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MnHNk5fhYzlVpf;
 Wed, 12 Oct 2022 10:56:38 +0800 (CST)
Received: from canpemm500005.china.huawei.com (7.192.104.229) by
 canpemm500008.china.huawei.com (7.192.105.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 11:01:13 +0800
Received: from canpemm500005.china.huawei.com ([7.192.104.229]) by
 canpemm500005.china.huawei.com ([7.192.104.229]) with mapi id 15.01.2375.031; 
 Wed, 12 Oct 2022 11:01:13 +0800
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [LTP][PATCH v2] syscalls/add_key05: Add userdel and groupdel
 before useradd
Thread-Index: Adjd5jE3lvc4sglfRNiAg/h5CAtMYw==
Date: Wed, 12 Oct 2022 03:01:13 +0000
Message-ID: <61954be9361d4d5282320b9ad58e8938@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/add_key05: Add userdel and groupdel
 before useradd
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
From: zhaogongyi via ltp <ltp@lists.linux.it>
Reply-To: zhaogongyi <zhaogongyi@huawei.com>
Cc: zhangerying <zhangerying@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,


> 
> Hi Zhao
> 
> 
> > If the test exit abnormal, some user/group will be left, and the next
> > running of the test will fail and report:
> >
> >    tst_buffers.c:55: TINFO: Test is using guarded buffers
> >    tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s
> >    useradd: group ltp_add_key05_0 exists - if you want to add this user
> to that group, use -g.
> >    add_key05.c:41: TBROK: useradd failed (9)
> >    userdel: user 'ltp_add_key05_0' does not exist
> >    add_key05.c:56: TWARN: 'userdel -r ltp_add_key05_0' failed:
> ENOENT
> > (2)
> >
> > Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> > ---
> >   testcases/kernel/syscalls/add_key/add_key05.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/testcases/kernel/syscalls/add_key/add_key05.c
> > b/testcases/kernel/syscalls/add_key/add_key05.c
> > index 71a88d1a8..e8d249040 100644
> > --- a/testcases/kernel/syscalls/add_key/add_key05.c
> > +++ b/testcases/kernel/syscalls/add_key/add_key05.c
> > @@ -34,10 +34,15 @@ static void add_user(char n)
> >   {
> >   	char username[] = "ltp_add_key05_n";
> >   	const char *const cmd_useradd[] = {"useradd", username,
> NULL};
> > +	const char *const cmd_userdel[] = {"userdel", "-r", username, NULL};
> > +	const char *const cmd_groupdel[] = {"groupdel", username, NULL};
> >   	struct passwd *pw;
> >
> >   	username[sizeof(username) - 2] = '0' + n;
> >
> > +	tst_cmd(cmd_userdel, NULL, "/dev/null", TST_CMD_PASS_RETVAL);
> 
> I do a test on my system
> #useradd test
> #userdel -r test
> #groupdel test
> groupdel: group 'test' does not exist
> 
> so I guess we can only using cmd_userdel is enough because it seems
> userdel will remove the corresponding group.
> 

If username is not exist, userdel can not remove the group with the same name.

I have seen the case on my system, but I cannot reproduce it now. 


Regards,
Gongyi



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
