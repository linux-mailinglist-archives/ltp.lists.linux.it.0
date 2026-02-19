Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OyWCQXMlmkvnwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:38:29 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EBC15D15E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771490307; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=qH2Q1Njfg/ENHc9dKyavF3ZI4uHeyz6JQdid5p6sddE=;
 b=Bg6lWMJnNdv9kkB3n1dy7qRf7DPmfLR/Lzq1Apibt2u/0hVSzrT35P/mIokQpp0hZeH8j
 5Yeg0CnRrF4OBypCVgBn9VZsXvNjCYKShNek9YJNC0Lt4N2tlYZ0kH615i+Bql1Amec1ukE
 sINBJdTXmOo5bhG1RhQCcCfAyCTpaXk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9B013D066C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:38:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 99A713D0652
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 09:38:14 +0100 (CET)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 774B01000364
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 09:38:11 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48069a48629so6758055e9.0
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 00:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771490291; x=1772095091; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBJ6t8MBYkiGa7wuYa4wuApgJZslzW/EAXV/pm1Pyz4=;
 b=dL2/WDpYzzXrkVQBVr5nMVCyGxcoKNdoL0zvAtQV5zH78dOADtiN9zacgJ+xEIn3At
 7FoZ27UobTXS7o+cCsRxlPqz3VpJuvVWvjfHEFfLa+kbR9vVl9FQ/VAxynOeZlZ7qFvp
 ZTxorOvWVQ2vs2lCjZ0nTSFZNVMasCchGovqJERO3a/naXesYEJzWA+9+LRNwITKJZUm
 7CW10HQY75FdEscPP2KfhrFwasfWJFqIlXTbOokJSYw66q6BX7bQ0ZVSumQgOxqieTst
 m18LOfpicH0crLuzcSHXYClhXDP9/O/6XssQzAsJINaOJVLOVsSCP22l3XGBSTsP6fNM
 GqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771490291; x=1772095091;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oBJ6t8MBYkiGa7wuYa4wuApgJZslzW/EAXV/pm1Pyz4=;
 b=oHRV7GVEFijBhAUehFA0XMECh4YvbPsG4m2OSX1lNHCjqplsEPdbwtpljuzwovxShF
 UhOt9JEHByKI5o1KXjynROleBbITd4cZZYoDiy/c0xMUvOf0DpHRffaEtxfrlxn2zxsZ
 s/Z8BfVK+FkzlBe3RAdooVLxRdJdChMDmrfAo4fzPiSyqZnufFtpzVQERj8I/TwNwixf
 DyFnVVXrnBZ4AnOihvg0pbnfp+xwA0Fkjz/9a+XkTDA67Eaoj/hrIrn7UE9E+gL55Avo
 vD9UOZ7D4agoHCyC2Arasu78a8D+9Coj0NFy9LK120M5nQLPQfkHz7XKU+dbOfMIqI+8
 LJ0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL4GWuV71iVR1ulKh1tGIqB4VKybDiXYeakFLzqZeXTgjVDkl/Kz/hCaEC2P2K6lKwXis=@lists.linux.it
X-Gm-Message-State: AOJu0YxYna3CIKA/+flgbEFMF0YNqUnAoFM8hbfqevKzuT9YR2GJdIPP
 i4ZkLSqO5Qw4R1yIOMxgHlmU/BFgpUnO4gj1xI9WbiO/ZoYQzJOC9Ksuy4PmSeLLkKNPGMUt3OY
 GtM87
X-Gm-Gg: AZuq6aKarCIwhGoYByJCUEWje07VSIA0a6Tn0xvE5+kdnVVlc7qXacuezGZeLwyHl64
 ff0OLGyeLEXjWBUZYrWD4bDsCPUdiXv/HBXgm8q89kgOihQpyGHNIQ5u27zvaygKuz5Ul73kKul
 +XqNAwKfM5zAq1sj5p9wiJeNgds3c2F7ycN9o0Fujgdo3L69YD/2s3OugV7gRKCdivafbLOC0NJ
 hWghmfdenDaRECXXRGMF5tn1i4Mty92abqsfUTv4pOvSzLJzmB/6iVRrgHXBBJcl0KG4L1L+84W
 yJbqUmTKJza9vxFLykea3R9bj5ymJdpntSba8x5AUqA9DUBjGxYQtBsGQsiUo+EgxBkT7xJ05HO
 aAdz529VQDFuidthVybRGNMW05XIdJp4kg9ZAWQiM8xHQjy2xH4FVk6Zb9SVQlev6sLt5l6Auv4
 mIx/RDnRGe6uYJeORn9+1uN41UnvryA91B+R5sVI7MUzCqV/GZLQs/ieXzyFoVabnek1ktQWGUX
 w8z+LUcH7zBgWWHXuBfU854eLSW7g==
X-Received: by 2002:a05:600c:820f:b0:480:3b4e:41b8 with SMTP id
 5b1f17b1804b1-48373a5baa7mr356656775e9.33.1771490290798; 
 Thu, 19 Feb 2026 00:38:10 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f98abb6sm22740845e9.4.2026.02.19.00.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 00:38:10 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 09:38:09 +0100
Message-Id: <DGISWCDUHBMA.2F7A9PHRPABQT@suse.com>
To: "Martin Doucha" <mdoucha@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260218174139.94454-1-mdoucha@suse.cz>
In-Reply-To: <20260218174139.94454-1-mdoucha@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] readahead02: Always allow at least 100ms for
 cache to fill
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: B3EBC15D15E
X-Rspamd-Action: no action

Hi!

LGTM

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
