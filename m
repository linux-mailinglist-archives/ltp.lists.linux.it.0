Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGKfEQeZnWnwQgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:26:47 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F3A186F09
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771936006; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=ZlHqTTfbjTv0WtYMv2bOEtF/Vo2wrIojyV079wGYO9A=;
 b=A4eJqlTjpFtiuwBaoG7gmhFIIoyL+Y/eYCPtIn7ckJKNtnbNmQ1B8Ea12r8wHls4elGC/
 OHIIBHntUNqa+F5hdqeB+1S/FaUguBPKRhY+ha198Mzozl+yT++2XkjDMG5IImTuby7u7xx
 A3CvuW4ol7TAMTSo28wRCDhQ6JKLbzw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 807D33D0F8F
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:26:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 380753C5AB1
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 13:26:44 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AD0311000980
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 13:26:43 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so49141375e9.0
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 04:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771936003; x=1772540803; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKkD6eqbyxvf630OpnZaMuQ5NDdBrLCULs+NXbVZ5gA=;
 b=MOdOMeMGoiiAiHgRr34IsasL+uwK4GVGoQXEeU1/0JG+PG8PMsZMbTax0SzBAR+ioJ
 lrWdG73QFr3X69rBityvAsk4eH8Voja+qmClW88Pbv7DM54v3EBfj3Abk+t/wcGmtpYF
 a8d5jqlW6PN+ZkeCgzJaaIQN65WUqsmAFLvTb/uQGggrmfiFmaEZAuH9SUnIkZfdNQta
 eE4sVpms6xn5wynWH515Neo40vCMnugn5Qx7307PDrfzzQT8QiFzY7b5JYAvoCnKbgFH
 oPEu+gBi7+/6FkcVWA0R89GtURG6blrs4KHWBaSNagtE5kUh8RMR+Ru+RVD4SyElT2vS
 lyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771936003; x=1772540803;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKkD6eqbyxvf630OpnZaMuQ5NDdBrLCULs+NXbVZ5gA=;
 b=abnt1PCi/R1vS77I8OFSxGINlleTyp/5pzgyEtlQW0DetusfrddN2rq64jHsGaAslV
 QGoBSKZoTOY3kGXMqeFFwpdyFcZTfZDFGuxX3yc2Qzyb5vIa/7gkb72Et40aJ9Ih2XMu
 8HhxfccRljdCRTjAXqbTH7jkRgO018pDNFeq6XY5xTbGISeJdVylnSb0638g2qnoeUwC
 jTb1z9rgJV8zUfMMXo1EtYC2uhmwwQiDmGrYwthQxzfSGN/AmVsaUrIL5TG6U5hOyC4B
 GDP00smt6ZKcEKkUX+KJOKT5dvnd3WCGedkdtAv+QR2dKP13kFyaaowfP9KCDbytDLR5
 0SUQ==
X-Gm-Message-State: AOJu0Yxg8zUK5KpZ+mujEuDNqSmK+BaKW6BBlBdwDqpCdTwuqy2SzH76
 mJIlEJxIo9aEFkfwTmTN6/+kLUr1wWd4pHD1gmkUrZ4m+xfLtWZXBX5Fk0nhBg6zpHI=
X-Gm-Gg: AZuq6aJgMCIsO7gFQi8zVeKq7p7Dufw1hyJeK02yAZMfzJq1IDn03a5dalKZIPuGDPy
 kTmxwVkBc6HjXkPxQLReSD/8McxGGJ4bak4SQ7Mr45ZDPEAUQyxL+4js0xdDQSzZiSx3fOOxdiT
 3RdElCrKi1luk6RG+feHdoTllK8Hn+aM+p4AMJ6skSUXatEWkZDNr6ktECgsdrf6RU59IAg5Tmv
 MX62ooFypLbPpOY6VTRZdM/gyV4yZWofMn0cNDb8Rgv09y9146BNgt32ifj01q1xdpNQbbJFJb4
 +NSC5SyyjCTw61VkyFYZKXBkncEY6P0uGs5IrCN0QYGurH2fwGll6Tp/sL39ARL9Gx2WRu8U2p5
 cLV62qt7MFFFs7kcMuydX+Z5jGNIdHeL5Zdc6k6TVEcaQnmB+gYRlyt2WddfpQ1A5zEquZzYFTZ
 BpRgVf5hVMnbac/iIOCJtunH6c/JCGlRlV3ug=
X-Received: by 2002:a05:600c:154b:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-483a962e38bmr186124725e9.21.1771936003062; 
 Tue, 24 Feb 2026 04:26:43 -0800 (PST)
Received: from localhost ([88.128.90.16]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b88e1164sm38883665e9.4.2026.02.24.04.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 04:26:42 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 13:26:42 +0100
Message-Id: <DGN6W1QXEUTS.2O8DK8JWGZ8XP@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, "Andrea Cervesato"
 <andrea.cervesato@suse.de>
X-Mailer: aerc 0.18.2
References: <20260224-remove_runltp-v4-1-75483a655894@suse.com>
 <20260224112235.GA43138@pevik>
In-Reply-To: <20260224112235.GA43138@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] Remove runltp `scenario_groups` leftovers
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[picard.linux.it:server fail,linux.it:server fail,lists.linux.it:server fail,suse.com:server fail];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim]
X-Rspamd-Queue-Id: D4F3A186F09
X-Rspamd-Action: no action

> nit: entries => entry (you add *test* => 1 entry which can be in one or more
> runtest files).
>
It's talking about multiple entries of the same test into different
runtest files, so it's correct.

I'm gonna merge the patch, thanks for the review.

Kind regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
