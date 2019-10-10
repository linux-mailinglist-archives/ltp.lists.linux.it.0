Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40372D21AD
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 09:35:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 097F33C1CA2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 09:35:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E4C5C3C0B87
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 09:35:54 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD3FC201288
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 09:35:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2E0730A7C61
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 07:35:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C85606092F
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 07:35:51 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB1524A460;
 Thu, 10 Oct 2019 07:35:51 +0000 (UTC)
Date: Thu, 10 Oct 2019 03:35:51 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Ping Fang <pifang@redhat.com>
Message-ID: <2126517382.5475715.1570692951519.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191010064324.GA2615@dhcp-0-148.nay.redhat.com>
References: <20191010063750.9605-1-pifang@redhat.com>
 <20191010064324.GA2615@dhcp-0-148.nay.redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.155, 10.4.195.12]
Thread-Topic: acct: fix version check on big endian system
Thread-Index: mdqNex0qlSFji2sMRQ+LV1p1jl5qwA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 10 Oct 2019 07:35:51 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct: fix version check on big endian system
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
Cc: liwan@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> On Thu, Oct 10, 2019 at 02:37:50PM +0800, Ping Fang wrote:
> > ac_version = ACCT_VERION | ACCT_BYTEORDER
> > which is 0x83 (131) on big endian system.
> > 
> > failure output:
> > tst_kconfig.c:62: INFO: Parsing kernel config
> > '/boot/config-4.18.0-147.el8.s390x'
> > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > tst_kconfig.c:62: INFO: Parsing kernel config
> > '/boot/config-4.18.0-147.el8.s390x'
> > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > acct02.c:192: INFO: == entry 1 ==
> > acct02.c:147: INFO: ac_version != 3 (131)
> > acct02.c:192: INFO: == entry 2 ==
> > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > acct02.c:141: INFO: ac_ppid != 34501 (34500)
> > acct02.c:147: INFO: ac_version != 3 (131)
> > acct02.c:182: FAIL: end of file reached
> > 
> > Signed-off-by: Ping Fang <pifang@redhat.com>
> > ---
> >  testcases/kernel/syscalls/acct/acct02.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/testcases/kernel/syscalls/acct/acct02.c
> > b/testcases/kernel/syscalls/acct/acct02.c
> > index 7c2a27046..c513b2145 100644
> > --- a/testcases/kernel/syscalls/acct/acct02.c
> > +++ b/testcases/kernel/syscalls/acct/acct02.c
> > @@ -142,7 +142,8 @@ static int verify_acct(void *acc, int elap_time)
> >  		ret = 1;
> >  	}
> >  
> > -	if (ACCT_MEMBER_V3(ac_version) != 3) {
> > +	/* In big endian system accout version have a ACCT_BYTEORDER 0x80 flag*/
> > +	if (ACCT_MEMBER_V3(ac_version) != 3 || ACC_MEMBER_V3(ac_version) != 131)
> > {
> 					    ^^ should be &&.
> >  		tst_res(TINFO, "ac_version != 3 (%d)",
> >  			ACCT_MEMBER_V3(ac_version));
> >  		ret = 1;
> > --
> > 2.21.0

Can we incorporate ACCT_BYTEORDER into that check?

Kernel appears to use it at least since 2.6.12-rc2. We would just need
define it for !HAVE_STRUCT_ACCT_V3 case.

diff --git a/include/lapi/acct.h b/include/lapi/acct.h
index ebd65bbf4df7..112ee48d8aee 100644
--- a/include/lapi/acct.h
+++ b/include/lapi/acct.h
@@ -64,6 +64,13 @@ enum {
        ACORE = 0x08,
        AXSIG = 0x10
 };
+
+# if __BYTE_ORDER == __BIG_ENDIAN
+# define ACCT_BYTEORDER  0x80
+# elif __BYTE_ORDER == __LITTLE_ENDIAN
+# define ACCT_BYTEORDER  0x00
+# endif
+
 #endif /* HAVE_STRUCT_ACCT_V3 */
 
 #endif /* LAPI_ACCT_H */
diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index 7c2a270465c5..4d95aafec3e1 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -142,7 +142,7 @@ static int verify_acct(void *acc, int elap_time)
                ret = 1;
        }
 
-       if (ACCT_MEMBER_V3(ac_version) != 3) {
+       if (ACCT_MEMBER_V3(ac_version) != (3 | ACCT_BYTEORDER)) {
                tst_res(TINFO, "ac_version != 3 (%d)",
                        ACCT_MEMBER_V3(ac_version));
                ret = 1;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
