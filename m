Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHv1MsRLmGmaFgMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 12:55:48 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB51675F7
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 12:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771588548; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=QIg1XtfGuMTcGngl85pgfCtzRU6QLEyoFeA9R/1kvHs=;
 b=CLFQX7TCKXZpKI4Uiv08Ljehi0ETIjgIhcMaLC4r4xzZ560M9niBQOExQTXE48Laa4gdE
 m0OQbK1SqqE2kD/4m48duwe4yU1FAI4lw7XQzChagsG/Y4ppSQBHiYUe0x4h9XBtx5srfu7
 Os9WulFRJx2JJQtX9G3qE2j3N0nHDfo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1262A3D0820
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 12:55:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 586623D07AC
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 12:55:36 +0100 (CET)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D69C1200071
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 12:55:35 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso1874614f8f.0
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 03:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771588535; x=1772193335; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4/OdIxyFyVWxl7J5dQ++1uc3vIY9sggRip6A+LW10A=;
 b=C/DxES4v3df08LYNYI0m8Ms4TFGBZf8KBz29x7sB/YuDd0oOEF5bVTH9SKuyOA/Hbx
 ViLuH71o1whihj45PixmvkQRn7AbhA0mmJsOoxaNkuWLx9xpm/HU0QfLvLEjq3I6XMNu
 rfMKV9ZJfuz72eXtTFbJ6wpOkwbXK21ZD+KjBAE7eyPipFi5ggz4Ad54p3w0Esiz6mLJ
 CYoW/Ief2PkgOKG3GPHJj18r0ZhA1OLszWBHRjYv3FEW77xYLOlu7EdihLHQjrPcxjeC
 N/0mNUVvkJPQ0YlCodDgwVhAXXMf+MDP91GFAn0DQSD/NqhZs3xgDiMMY+Tcfot80DMj
 n5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771588535; x=1772193335;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T4/OdIxyFyVWxl7J5dQ++1uc3vIY9sggRip6A+LW10A=;
 b=B0FgXNFBI7bB+wzqxqrEkWvvaMmEeI2ZaCa5yEMciGDYUpXBgPGJNvc4VjdwDoxFDQ
 Sv6h6owBsIZIQB2xRt/Y7IHT4M98qe3TjV7M5sRyB0BGpNZdUekvrH3xyV/X9Kprn2gg
 kjVPNgyfF2iTyDOD0UmdI1Um4NX0Ujmy0LMSNKNtAKT/R7szTkGMDRIniurgElrPjlDZ
 jUTshgkuHZBEKIabwVdnghKy8vpyhPSPpqxqCwez+RlS6flLQ/D/8DRR/anmeGkQE1qL
 5vtc6bJXUSwz7WzNuQ+c4ER9/PMH9NrntiJ7/+H1esMa6JFAQhN4/G18mJAaCXNQrTUA
 gXYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX23xpK+d9OBpwqyPQGJWM5qEeSt9qXFFJINJzdG/RWokial8dgjEz1obb6ESArEZywNpY=@lists.linux.it
X-Gm-Message-State: AOJu0YwWTEFPnjkzGxrLGqbwP39t4E+BTj9F74KsRkjrYvkxnMvVCXMo
 oPpUig/Zr4LZMzK/Vqu9RgXb6YGQsPG5DOpfrtJmOKlPpsZ/EawbD8YUCEDB+vK5kII=
X-Gm-Gg: AZuq6aLP4ZH3iZN+HokbOlrfpAxO8t0mlIxvJa137X3NZvN/uFSTV2glkOhDt7UuhcJ
 bxHNAi7qV0jW5ek46TIbICYq4ERyjf/rO4X1bH4gw3Fm1mNXAPK2zLEX9x7JHpZcqCJmDRtGZLu
 qKl2AzVRdOH2Ze7QaR6HnW1BTS302oNIXIUbhX8yTssocfjTftNi4FAfFCxwI2tLVnTXPEQg/D6
 GyaytMx5+jRXqQRRKBDIQoJYIW23YYhTVWJT1+ysixdyi266De3PVeeBNLyt4/9jptbDdAy/3ie
 NspPWMHwcZYmYrdaWSSVND7pc9sfFMZ1xQLqOY/fK1BG/7ze8WRm8n86tnVCvYrzt/MRvQlNeuk
 ZC3I0yeYUtBBaNcDEm9nFttQxQ3VI1/TFK8w2ANV0g94/FmL/Qw+3ftiG0/jNtTTVYiGsnCnepY
 1zX7WOx8mNIEZBGPV2pgZ47irvC622FVW/1nnO1kvDeaSooEFfF8TreAJ82syVaHIOmWfdtT/y4
 AaDlyouE/sM/PO32BA=
X-Received: by 2002:a05:6000:40cf:b0:437:6963:a104 with SMTP id
 ffacd0b85a97d-4396af28679mr2987785f8f.20.1771588535207; 
 Fri, 20 Feb 2026 03:55:35 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm55764824f8f.13.2026.02.20.03.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 03:55:34 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 20 Feb 2026 12:55:33 +0100
Message-Id: <DGJRQ12H3RLS.2VQKINB5A8PDE@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260205121540.329921-1-pvorel@suse.cz>
In-Reply-To: <20260205121540.329921-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 0/6] Remove runltp
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
 Tim Bird <Tim.Bird@sony.com>, Julien Olivain <ju.o@free.fr>,
 automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,virtuozzo.com,sony.com,free.fr,lists.yoctoproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 67BB51675F7
X-Rspamd-Action: no action

Ok, let's kill this runltp! Can't wait to have the kirk PR list full
of bugs to fix ;-)

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
