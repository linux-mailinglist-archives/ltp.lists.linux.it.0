Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GHmETQan2n3YwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 16:50:12 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9822199F89
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 16:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772034610; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=m7n/4YSNFv6KcaG4l5EqXp1LmfQHvXzpqjvHbT4f5s0=;
 b=Sv+iOFnLOK9R3IGvjbSLrM7lCfUY9glU1vsmuJbFKtfKlHFBfhBTBnArHD0gp322mwnEY
 853V+58F7zsHL6DWcoejXVtEydrMKkrX1BCq61Bjo545rwLPwFDLfap2Do1z+dWuYSbNuI2
 2xFXj+qBDKYqfzQpaESHVqVDnrJQ13k=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0D9F3CA085
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 16:50:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 060A73C7B03
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 16:49:58 +0100 (CET)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7E4E810007B8
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 16:49:58 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4837907f535so62370085e9.3
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 07:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772034598; x=1772639398; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAqtJor5hRJopK+4TLeaGAjFM8/ZtARpLxP4Jp8AkCE=;
 b=Z2EKzkQgvcf7yyelpGjuzZzjlcSRPjDoqGKwfllRxNJmmbcSsIApSBXUZgSbJGpiAS
 wWaFPJQqMaiCjAC+VDN6g23SIMh6+NMwa/K2HIixf6BejQxcUFJU9sIXahPGLtC6Cmwa
 SLdyrvVNqW514XovPbS/Vy1QXntKymljKnRmHbGBCIJTQtZnx+Kamr6z80oHU3S5dsHM
 ZWYh1J6UEvHQVmpNVE/kRLi+UyzULBLsQ1ZdwTN2Y3MG3d2q7vek7ZhDCxiepbBmbMFI
 yWE2Dso8zZUg1+3mfEAb9JqZ3rA/YlK4jrWT7LMIISe3VGE/0hFUcJ8oqo9OzOyzvSH/
 9bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772034598; x=1772639398;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cAqtJor5hRJopK+4TLeaGAjFM8/ZtARpLxP4Jp8AkCE=;
 b=RfmU2VxuBXKuS4aPPyPIhePF4q/9v9zcEQHizL7W9bcEidp23Q9v2ZflHc1YSBjdL0
 gQ0qp7JKCdlPz0usJFPBMFX2TGrHFKuE+SrO5hS7qSW+gWtw7x+FBl0NMihawIHekZsD
 X258h1xKrnbFnYbcz28weoXSwsXSbkb7Njx7toVRUSbTgDTa4Is6ZsZPgtOzH5UuVjQW
 TS/JOzoWdNB5MOAgBtv0W32+bbD/pMP9fsd8QOvgUhvwLyQBMqyiFCXF2M/W9AA6dv5a
 0fDT/TUwmduNuqEQein77Lu48QB4VoTICKYtSJFuo51aMSHopVCrDH5ymyYF2yqb2b+Q
 5qXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe25SbQrAkGOyKcMfK/dywafhS3giOBDHmjFdaV23nCoBoe/u2zvaqRfXeVB0oHnY/nRw=@lists.linux.it
X-Gm-Message-State: AOJu0YxrolT0i8hd+MSWm30++Cv1kw991Pty9ZBiNOaGK1Pev3LxeRGm
 ewnSGWndhIjShfixYwpZGS2F62Vrm3w4dg56/haDVRP86GLAcODlvaJh94JqOH1oHpo=
X-Gm-Gg: ATEYQzxfN/HlNSHCvNrQlpelHpYOfrkZxVKGKamGC+vukVvHoBULuN/7jN+mARoS1PN
 1hIW1os33SuVzSWDFto7IBiFtNLLxqw9sQGtmX2ulI2Wb2wMu9IUsBO3p8vkGU80F365v8JW5XI
 4ZI50KFGtWD6UJJ3/hygYtiTYW+jplSzbkO+hb9sLZMW1DuiPy+sXVF5vV7ZBoLmLS8IRGYCl8U
 qxWHxDMYLupJ1E+bPAFPpfwTa0Y8Dv23qLQQHPB75rTL1UzfbNK0waBNcdQQW2nKrmeoyNKVRfy
 FETF+p1r4lhLtSj6pjN49jSvoZotZmiAv72NVqR6UmiKSJhN40P6+mT3fik0BEBEB0ra0QdrLZ6
 nPftdJMYzzSTessuCDNtgZ2pv61OpL6Kp20JmKit7jxwsPa7QCaZ0JxvBsChEKthe/pyUtIyvSu
 jpF36FFDoZbJWQxC7VnfCjYboc
X-Received: by 2002:a05:600c:a085:b0:47a:81b7:9a20 with SMTP id
 5b1f17b1804b1-483c216f3dcmr15026985e9.9.1772034597718; 
 Wed, 25 Feb 2026 07:49:57 -0800 (PST)
Received: from localhost ([88.128.90.40]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb987b0sm13820145e9.13.2026.02.25.07.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 07:49:57 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 25 Feb 2026 16:49:56 +0100
Message-Id: <DGO5U7CVA15A.1TGO497R7HODK@suse.com>
To: "Martin Doucha" <mdoucha@suse.cz>, <ltp@lists.linux.it>
References: <20260224162726.28933-1-mdoucha@suse.cz>
In-Reply-To: <20260224162726.28933-1-mdoucha@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] aio_cancel_3-1: Rewrite test
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
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url]
X-Rspamd-Queue-Id: D9822199F89
X-Rspamd-Action: no action

Hi!

Acked-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
