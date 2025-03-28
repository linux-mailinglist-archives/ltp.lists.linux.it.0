Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DA5A74946
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 12:36:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743161773; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : content-type : content-transfer-encoding :
 sender : from; bh=tG279FHxeMAMwhctIlVmLOrpls8LfYEn0M0A7EIK9vw=;
 b=VVP6mamApLO+d3KYXCby8ZDlb44QYjYLNOixKDqIXXP091/rEEcMJDokfZ2eLV6BiHOwo
 kjV1qufkYcXjKbkeC8mzkl6JigO9scl6sumz3HZSiNd67cRtBpVvqbn/DRm4fTNu8eyznNN
 vWh/TJ0e0ub90UihBV7ExX/de9aeVGw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27BDE3CA2C0
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 12:36:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with UTF8SMTPS id 250E03C1BD3
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 12:36:10 +0100 (CET)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with UTF8SMTPS id 56B5010005A2
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 12:36:09 +0100 (CET)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so1660375f8f.3
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 04:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743161769; x=1743766569;
 h=in-reply-to:references:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QdRXGags3zyeKEaUvCuVTP5gNbhQFXNEn6cAWOx8XDo=;
 b=gHPRLBCNTVolIiSVhVuM/5tVcxJEqd0dZ6Qr7AW+ZJqjzGNMp+pAiUY8jPLkK2nPOb
 yzKHim1bU+MBSKnFlq84zNYpmKvPV494Otx9vIfb4VgbY1VUwGb5PqOb/8alZT9e1vIu
 VyM6ecEI+airpkSIZuwtGU9cUdUr5R+YwFAYjNc3vKqXgiz9UGcX/s79ifLxsisTErqi
 I9u+RerV5fm4T3/PM5DxsMhrYX3dycVGA/CxR6fknhFFkLy6/bhA3dpzk9bk+bMPH7Tx
 qe5R6VeF1ULqhiU9DNyF/nUCDqSpzSQyQLhZ6RNYKvo8gnshvskDGknXSTWQinJGMTHY
 +BdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRvPaKVWxPV4Q/QmqWJKY4juiIChsZSpb9fV/yvwWnVFiuMs/c35VXNqZ12aj65qmibh4=@lists.linux.it
X-Gm-Message-State: AOJu0Ywzhic1EXlY39ENCLZxgDDvt/lbsYns9OBi1Kd1zZ1mBcwSEOYZ
 gXnxeXrZUWnYCTa2vrihMbJEtYVEdK/2ZzgpIuPJ1ftgjoG4X2zmtNZVR5hHX+I=
X-Gm-Gg: ASbGncul/zuy62SQ2wYgHumLXBmNj9d97QGsyyLrCn0GxtJf1Teo66zgojHQNr6f4z1
 1rWEBi9LPQvCbO6bBfSfGpK8aOJe2HntsY0e49smmZwL016w6evgnygDupi0HXBay3CaHQdJjsu
 Q8t6KwIPsFpAKQTM2dBQllMaRMc+okgyjgKftOmETQHz7xKSv+6PngQofB+uFhb61yONfK5UVVr
 ny3leadaUvZmSM9vR4N1KI8qidp9zBmCGYVjVf6UHOJdk7dkw9PVxked3xdWy+sP6ZhlgCrMQ/s
 lPTpzhnTeB95mTiKyDmoYoY+3UvuHPurkA==
X-Google-Smtp-Source: AGHT+IGwWdNwPblcr7mphR1WNMu9h9QrATroVJi/37MgwrOCTSoKJzhb7aTTAnR+CnuwqTFqrICAxw==
X-Received: by 2002:a5d:598d:0:b0:394:ef93:9afc with SMTP id
 ffacd0b85a97d-39ad1741b23mr6650507f8f.18.1743161768608; 
 Fri, 28 Mar 2025 04:36:08 -0700 (PDT)
Received: from localhost ([179.228.213.210]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af93b8af15esm1374275a12.53.2025.03.28.04.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 04:36:07 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 28 Mar 2025 08:36:03 -0300
Message-Id: <D8RV9V5D07EO.ORPMFWGXAMSO@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.20.1-31-gf6db7c329ce0-dirty
References: <20250328095747.169011-1-pvorel@suse.cz>
 <20250328095747.169011-5-pvorel@suse.cz>
In-Reply-To: <20250328095747.169011-5-pvorel@suse.cz>
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 4/5] Makefile: Update 'doc' target,
 add 'doc-clean'
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
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsae+/ve+/vXJlIHZpYSBsdHA=?=
 <ltp@lists.linux.it>
Reply-To: "Ricardo B. Marlière" <rbm@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Fri Mar 28, 2025 at 6:57 AM -03, Petr Vorel wrote:
> 'doc' target previously run docparse documentation. Point it to doc/
> directory so that it build sphinx docs. doc/ dir has metadata/ dir as
> dependency, no need to specify it. Call also '.venv' target.
>
> NOTE: it's still possible to avoid virtualenv by calling 'make -C doc'
>
> Add 'doc-clean': to remove only generated data (not optional .venv).
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes in v4:
> * Use 'setup' instead of '.venv' in the top level doc target
>
>  Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 5066789349..6aa77e1b9b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -170,7 +170,13 @@ INSTALL_TARGETS		+= $(addprefix $(DESTDIR)/$(bindir)/,$(BINDIR_INSTALL_SCRIPTS))
>  $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
>  
>  .PHONY: doc
> -doc: metadata-all
> +doc:
> +	$(MAKE) -C $(abs_builddir)/doc setup
> +	$(MAKE) -C $(abs_builddir)/doc
> +
> +.PHONY: doc-clean
> +doc-clean:
> +	$(MAKE) -C $(abs_builddir)/doc clean

IMO the top-level clean and distclean targets should be responsible of
calling the respective targets in doc/Makefile, what do you think?

>  
>  .PHONY: check
>  check: $(CHECK_TARGETS)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
