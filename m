Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 753FCD2853
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 13:45:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C13C53C1CB9
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 13:44:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A05473C0DFD
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 13:44:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DF5DB6008C2
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 13:43:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8312EAD00;
 Thu, 10 Oct 2019 11:44:53 +0000 (UTC)
Date: Thu, 10 Oct 2019 13:44:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191010114452.GC23153@dell5510>
References: <20191010063750.9605-1-pifang@redhat.com>
 <20191010064324.GA2615@dhcp-0-148.nay.redhat.com>
 <2126517382.5475715.1570692951519.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2126517382.5475715.1570692951519.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> Can we incorporate ACCT_BYTEORDER into that check?

> Kernel appears to use it at least since 2.6.12-rc2. We would just need
> define it for !HAVE_STRUCT_ACCT_V3 case.

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

>  #endif /* LAPI_ACCT_H */
> diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
> index 7c2a270465c5..4d95aafec3e1 100644
> --- a/testcases/kernel/syscalls/acct/acct02.c
> +++ b/testcases/kernel/syscalls/acct/acct02.c
> @@ -142,7 +142,7 @@ static int verify_acct(void *acc, int elap_time)
>                 ret = 1;
>         }

> -       if (ACCT_MEMBER_V3(ac_version) != 3) {
> +       if (ACCT_MEMBER_V3(ac_version) != (3 | ACCT_BYTEORDER)) {
>                 tst_res(TINFO, "ac_version != 3 (%d)",
>                         ACCT_MEMBER_V3(ac_version));
>                 ret = 1;

FYI v2 merged. Sorry not adding your Suggested-by: and Acked-by: tags
(you weren't in Cc: for v2).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
