Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001ED2274
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 10:17:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F06193C1CA2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 10:17:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C852D3C0B87
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 10:17:02 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 31B6A1401A8D
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 10:17:01 +0200 (CEST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7136E83F3D
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 08:17:00 +0000 (UTC)
Received: by mail-pg1-f200.google.com with SMTP id x35so2970467pgk.1
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 01:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EYrhXJq29LVLFigyaI09soLFZbVKt8WMOpFW+w4NFnM=;
 b=Hbj7l7mgbUaVBjT/F3OMcY2+Sf5tycvXg6BK8b+G03rZWn/3vL+HmzY9pF3nlZuYFz
 pNpwr7bmr2CT0ZzSY+Lj2U/hOlErklXupNVgRuLudMht9XcklkvtSiMsjkOqehS3Zcuh
 GW6vduTJ9EuKwGdyGssuqdnsbJT7Sh8Hb/9pf09oiMab2zInprAikBLiFSw5TGyjkkG5
 Z3yte7glwdtoJmtNelEwUvp44eNu/9cZQOiJbPLAUoZhg5CbASe4r0xkILqr3YJpy8Mw
 mO2lmphtp5NIq2tKz+/KbYzQarYfxgnBh4WrUZqhSG95AOJh3STE8gNHbHqm3ey6sSyI
 ECXw==
X-Gm-Message-State: APjAAAUpXq56HLa4/1MQIMQpCJ5j3UIVAMOwdlJX1/6nkdhOMHNrYV3v
 kHIsmxhIRlfn56kzwSCsuSjrYgESs9EGe3WIkwYGv84GkxuEBzkuRVSUWwxOlH61xyTF7ddrImi
 JZXcYpoRyAA==
X-Received: by 2002:a17:902:9888:: with SMTP id
 s8mr8185512plp.193.1570695419980; 
 Thu, 10 Oct 2019 01:16:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyglh1PD1Cv0Ff4jR/SRvTMds0MM+QdprTBEFV85xP4qVeHs2jrDLFPGhlheTiQ5LmD5sxN/A==
X-Received: by 2002:a17:902:9888:: with SMTP id
 s8mr8185474plp.193.1570695419654; 
 Thu, 10 Oct 2019 01:16:59 -0700 (PDT)
Received: from dhcp-0-148.nay.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 30sm6421208pjk.25.2019.10.10.01.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 01:16:59 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:16:50 +0800
From: Ping Fang <pifang@redhat.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191010081650.GB2615@dhcp-0-148.nay.redhat.com>
References: <20191010063750.9605-1-pifang@redhat.com>
 <20191010064324.GA2615@dhcp-0-148.nay.redhat.com>
 <2126517382.5475715.1570692951519.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2126517382.5475715.1570692951519.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On Thu, Oct 10, 2019 at 03:35:51AM -0400, Jan Stancek wrote:
> 
> ----- Original Message -----
> > On Thu, Oct 10, 2019 at 02:37:50PM +0800, Ping Fang wrote:
> > > ac_version = ACCT_VERION | ACCT_BYTEORDER
> > > which is 0x83 (131) on big endian system.
> > > 
> > > failure output:
> > > tst_kconfig.c:62: INFO: Parsing kernel config
> > > '/boot/config-4.18.0-147.el8.s390x'
> > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > tst_kconfig.c:62: INFO: Parsing kernel config
> > > '/boot/config-4.18.0-147.el8.s390x'
> > > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > > acct02.c:192: INFO: == entry 1 ==
> > > acct02.c:147: INFO: ac_version != 3 (131)
> > > acct02.c:192: INFO: == entry 2 ==
> > > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > > acct02.c:141: INFO: ac_ppid != 34501 (34500)
> > > acct02.c:147: INFO: ac_version != 3 (131)
> > > acct02.c:182: FAIL: end of file reached
> > > 
> > > Signed-off-by: Ping Fang <pifang@redhat.com>
> > > ---
> > >  testcases/kernel/syscalls/acct/acct02.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/testcases/kernel/syscalls/acct/acct02.c
> > > b/testcases/kernel/syscalls/acct/acct02.c
> > > index 7c2a27046..c513b2145 100644
> > > --- a/testcases/kernel/syscalls/acct/acct02.c
> > > +++ b/testcases/kernel/syscalls/acct/acct02.c
> > > @@ -142,7 +142,8 @@ static int verify_acct(void *acc, int elap_time)
> > >  		ret = 1;
> > >  	}
> > >  
> > > -	if (ACCT_MEMBER_V3(ac_version) != 3) {
> > > +	/* In big endian system accout version have a ACCT_BYTEORDER 0x80 flag*/
> > > +	if (ACCT_MEMBER_V3(ac_version) != 3 || ACC_MEMBER_V3(ac_version) != 131)
> > > {
> > 					    ^^ should be &&.
> > >  		tst_res(TINFO, "ac_version != 3 (%d)",
> > >  			ACCT_MEMBER_V3(ac_version));
> > >  		ret = 1;
> > > --
> > > 2.21.0
> 
> Can we incorporate ACCT_BYTEORDER into that check?
Thanks for your advice, I will post v2.
> 
> Kernel appears to use it at least since 2.6.12-rc2. We would just need
> define it for !HAVE_STRUCT_ACCT_V3 case.
> 
> diff --git a/include/lapi/acct.h b/include/lapi/acct.h
> index ebd65bbf4df7..112ee48d8aee 100644
> --- a/include/lapi/acct.h
> +++ b/include/lapi/acct.h
> @@ -64,6 +64,13 @@ enum {
>         ACORE = 0x08,
>         AXSIG = 0x10
>  };
> +
> +# if __BYTE_ORDER == __BIG_ENDIAN
> +# define ACCT_BYTEORDER  0x80
> +# elif __BYTE_ORDER == __LITTLE_ENDIAN
> +# define ACCT_BYTEORDER  0x00
> +# endif
> +
>  #endif /* HAVE_STRUCT_ACCT_V3 */
>  
>  #endif /* LAPI_ACCT_H */
> diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
> index 7c2a270465c5..4d95aafec3e1 100644
> --- a/testcases/kernel/syscalls/acct/acct02.c
> +++ b/testcases/kernel/syscalls/acct/acct02.c
> @@ -142,7 +142,7 @@ static int verify_acct(void *acc, int elap_time)
>                 ret = 1;
>         }
>  
> -       if (ACCT_MEMBER_V3(ac_version) != 3) {
> +       if (ACCT_MEMBER_V3(ac_version) != (3 | ACCT_BYTEORDER)) {
>                 tst_res(TINFO, "ac_version != 3 (%d)",
>                         ACCT_MEMBER_V3(ac_version));
>                 ret = 1;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
