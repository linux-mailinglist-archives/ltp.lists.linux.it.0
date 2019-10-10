Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C0D20E9
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 08:43:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 161A03C1CED
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 08:43:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8F7963C0B92
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 08:43:37 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E69C2600EC4
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 08:43:36 +0200 (CEST)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0027A2CE90A
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 06:43:35 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id 99so3225404plc.18
 for <ltp@lists.linux.it>; Wed, 09 Oct 2019 23:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XJcLzf84uhegBnahS1k9Yl1K4PFW5AmQJVyNzP9FG3Y=;
 b=ltURIwcwebtHhIxNDGMAz4xt2OabmyDwxnL4D//8diQnKZ7hIClS8H9n8K6CLEgmB7
 Lf4MUWKoZjiBS1jf07mLx5vC3mK+Tx1ZHJ59tSd+FayVJQKA5BEMl93PO3g0EIc2bfMR
 2/uV2AsKoOlBIdPhR4RsTPXBujaSYUTxLxjwv/1hp41F1RgzKhg6YaxQSlIH6Or+2mSb
 9xyaD6VgJe7k9or8ftBNXLrCrD2x/C24p4wpDiQl5tXATRRYM25IpzEETfDl2fRRHm5q
 zOlxdkWXhP8QWYBHT1FCs7mqHX27RVofC/SO+ftZOZ9P/OVcTnyqeJpxLVhHa04ilxEe
 YBNg==
X-Gm-Message-State: APjAAAW8exhoIhct+EUyuV7jsrddmPjvRz/AuCwCP2J/L1SE1AYGxD6D
 40g+ABW5J1PC3wPS52Xj5tkMP3pL036apiKkKGlHXeQWuvyh6tD+Qs9bKKxMqstuftmV2HCXtDR
 KkqG6NkjJjw==
X-Received: by 2002:a63:144:: with SMTP id 65mr9150685pgb.55.1570689814035;
 Wed, 09 Oct 2019 23:43:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytewxmUoWGX91+9PkE9MQ04m4L/Iv2/aA/NXQ8xIfHrBXgm89jvT5lHGoJdcMyrEm2r7P2sA==
X-Received: by 2002:a63:144:: with SMTP id 65mr9150653pgb.55.1570689813632;
 Wed, 09 Oct 2019 23:43:33 -0700 (PDT)
Received: from dhcp-0-148.nay.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c62sm5749190pfa.92.2019.10.09.23.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 23:43:33 -0700 (PDT)
Date: Thu, 10 Oct 2019 14:43:24 +0800
From: Ping Fang <pifang@redhat.com>
To: ltp@lists.linux.it
Message-ID: <20191010064324.GA2615@dhcp-0-148.nay.redhat.com>
References: <20191010063750.9605-1-pifang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010063750.9605-1-pifang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: liwan@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 10, 2019 at 02:37:50PM +0800, Ping Fang wrote:
> ac_version = ACCT_VERION | ACCT_BYTEORDER
> which is 0x83 (131) on big endian system.
> 
> failure output:
> tst_kconfig.c:62: INFO: Parsing kernel config
> '/boot/config-4.18.0-147.el8.s390x'
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> tst_kconfig.c:62: INFO: Parsing kernel config
> '/boot/config-4.18.0-147.el8.s390x'
> acct02.c:239: INFO: Verifying using 'struct acct_v3'
> acct02.c:192: INFO: == entry 1 ==
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:192: INFO: == entry 2 ==
> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> acct02.c:133: INFO: ac_exitcode != 32768 (0)
> acct02.c:141: INFO: ac_ppid != 34501 (34500)
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:182: FAIL: end of file reached
> 
> Signed-off-by: Ping Fang <pifang@redhat.com>
> ---
>  testcases/kernel/syscalls/acct/acct02.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
> index 7c2a27046..c513b2145 100644
> --- a/testcases/kernel/syscalls/acct/acct02.c
> +++ b/testcases/kernel/syscalls/acct/acct02.c
> @@ -142,7 +142,8 @@ static int verify_acct(void *acc, int elap_time)
>  		ret = 1;
>  	}
>  
> -	if (ACCT_MEMBER_V3(ac_version) != 3) {
> +	/* In big endian system accout version have a ACCT_BYTEORDER 0x80 flag*/
> +	if (ACCT_MEMBER_V3(ac_version) != 3 || ACC_MEMBER_V3(ac_version) != 131) {
					    ^^ should be &&.
>  		tst_res(TINFO, "ac_version != 3 (%d)",
>  			ACCT_MEMBER_V3(ac_version));
>  		ret = 1;
> -- 
> 2.21.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
