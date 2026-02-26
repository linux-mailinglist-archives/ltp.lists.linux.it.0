Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMVnAZofoGmzfgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 11:25:30 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D461A4335
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 11:25:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772101528; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=ncl4fYBhNZifs0Y7ZlsDP2ZPWUktEG/6G6EE4FNncpM=;
 b=TKfShHYb7vfYUu8stZDRMl7uCivaOCq9CEi963+I/6LblVjXntnXvdsVwUg9YQloJSzPf
 f5/hbuUuiyqG7ZHZC/kduy2XW/RsksTx4cHbt4NDXKoVnfJikHH6MNIxBavXPI4idRmJOl6
 O10iDMWoTn738UvLx48QQpjJ8Dcflhw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8639F3CB69C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 11:25:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5BF83C889D
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 11:25:26 +0100 (CET)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E3BEB20038D
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 11:25:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso6102355e9.3
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 02:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772101525; x=1772706325; darn=lists.linux.it;
 h=in-reply-to:references:from:subject:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJTp0fFloECjnfzEtiDEmthqkWQOZ9GS9xA0oG/tAfU=;
 b=OBprcFN1yof4+mrbGHcTR8ucLhkm+0q3aF6UOuLiHM3oF+oK1zeYv28gyR4geWm7th
 yfdgQT6buEVV0CFbLBHoR+ja/3rTRxbDBJ/QtDFGJyxEyMp8yZLBvd5igPV0Je8AqwfN
 NUcBoT8bGgVD2zCB4ndeium/F8rhSzyKku1noa72bKhoqZO39dnlGb3Ou3pl64HrbCK7
 zYPc64h69AUzohb1wdItWdIJnL59kve+Z+q82Gn2RWn4pvxrrxzF21c2bjtG5/b7M9d/
 GfGZsP/06jNWHHvr4m1OoH0LIA66CmtLO2yNgE5LCiGBOeiwyipX7Y+5VmHcDu1x91qR
 3pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772101525; x=1772706325;
 h=in-reply-to:references:from:subject:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJTp0fFloECjnfzEtiDEmthqkWQOZ9GS9xA0oG/tAfU=;
 b=E9Cwhw9GBqHYQjCOI3r47moeEBujgKYhR8c7YijRYJQFf2l2ylmlmkllVAFKc5za8o
 JcXGpDlNr5J7RMvchTQG6fazKHBOshVManIS/7MDeHtrt8xb/IpmcuSwMwH7t4kSbUjQ
 Kxtf+cRMgcxJ6hLlybHGRO/DmIn2eCwChxRQM6H1QdQq87Al/pH8YqtM0fyn0s8O28fB
 i9T0eCiCNpIosxKPscFNjeIC9/kYDCF0jwINyLZpJ0Dw5dcq97uJbL5UjtFXwU6Flk7M
 HONX240k8qSEwLoOdnyqbOQDJOpJKjNkXrlsdDy2PivGizDRwHKxS9tFsH7Odm86VCW9
 NdRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLi2xNa0KWrw4Jd9oGNaDEZrDgn29XbYlLKX1Qmlr2TPxbqW0Pt1WBzDe5ZCeI31GU6GI=@lists.linux.it
X-Gm-Message-State: AOJu0Yx1RN264jerSYwMgd00mjwQ2sz0qVqjpRqQBAHZUPRKTy2xQPyE
 0yJGLArn04DNcwPrvVGoo2fg61HICrq+vojxhFw+oKC9dpeGj3rtmeuxTAwjnX908VG7u41M9vi
 5GsCilGY=
X-Gm-Gg: ATEYQzwgfvrhb0B0b3NwqMSQ8Y8geunIrXYzvjdeRmG1hf/3Mid6ZaqdLKw0PnAHzc1
 LT5zI4HgKyQKz6Uz1Tu3Z/I0KCazE7YJOrARjg9misrU03cyRRXUixJtsrLhSVfpCEeM95jvOML
 6jXQ/TDlS9TY/NYF+Fw9nfxCn7edlYZ0fPMvGsOue18hnOgQlqeq6ZaTpKDBkFKcZphX/xDIPNu
 Pz4DJv4XoAEeE+TJoo6SHfBdvTuKmB6EKgMitwXuptdao9I1aM5DZBE9BTsH4dBb/K67VKpuxpZ
 16L5dmTTh5J/JRJpujfr/Bq2h6ZrT0uEzyC2IFzN+HH/RXgMQi6dJR1OdfRnsvOPvvZAhs/wkSn
 fJ7CHUeuYGlBMUOU9yqkh3fcuLbJ4rZdEwWjjz5LRBNCpjVfD6dfNVKpUff1EX4LKJOTxxrOp/0
 c40woRa/FGtKurYor0IZKzTNY3vzg8evu4mizsaQirrP7phXxidy/O3thZl6KnpT7X8ZgSKsBlX
 yjdrPbi3R2DIeo6Wwo=
X-Received: by 2002:a05:600c:4e12:b0:480:39ad:3b7c with SMTP id
 5b1f17b1804b1-483a962e465mr357081695e9.16.1772101525228; 
 Thu, 26 Feb 2026 02:25:25 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b3471asm39261545e9.3.2026.02.26.02.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 02:25:24 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 26 Feb 2026 11:25:24 +0100
Message-Id: <DGOTK9K287T0.3T6OW5Q28DIT9@suse.com>
To: "Ricardo Branco" <rbranco@suse.de>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260223131546.448607-1-rbranco@suse.de>
In-Reply-To: <20260223131546.448607-1-rbranco@suse.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v6] userfaultfd: Add test using UFFDIO_POISON
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
	R_SPF_ALLOW(-0.20)[+a];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto]
X-Rspamd-Queue-Id: 90D461A4335
X-Rspamd-Action: no action

Hi!

> index 05bb3ceb1..2ad8f8b1e 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1775,6 +1775,7 @@ userfaultfd02 userfaultfd02
>  userfaultfd03 userfaultfd03
>  userfaultfd04 userfaultfd04
>  userfaultfd05 userfaultfd05
> +userfaultfd06 userfaultfd05

copy-paste failure :-) pointing to the wrong binary.

> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +};

Please add a .cleanup to call reset_pages() in case we fail syscalls.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
