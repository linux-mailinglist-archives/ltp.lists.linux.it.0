Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HZLMGbenml9XgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 12:35:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8B1968D3
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 12:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772019301; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Wfk4xEpsZVROzV0N0e3SuChL9KlOeX3vk3tHsiIT3B4=;
 b=TdFfBIjZciA9a+qSzD1oHAINM20pbPbWDANG07FlngAbK45fTw9mq1D44rHELGalylXjV
 8gP8ZfDH5InaRQEJUTIkEfizMKkebixRXCAP/51h6vsbiF6mJYF3yuyqPA3gSC0ZyEYCMTn
 moH1u8HxM5ES0YFKwYXkzJCpyNbA31o=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC82C3C2C9C
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 12:35:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 743B33C2C9C
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 12:34:49 +0100 (CET)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D34F620009C
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 12:34:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so30784195e9.0
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 03:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772019288; x=1772624088; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWYXEUEifFZBMHeVmrbJAPnEJvyyfnEVusXUsSRAp9o=;
 b=gXTbGpKD6wZZoln3FMuqCEbnZpiyi9S1ReLrE34PRCI4F3xzq1N7rmwkDOnqgqnLWC
 NuogtTNmdClqWkC7Hk3ulk+AW5ZnkFQLPQos7rMWhRkgtwZrdJPOyB60kgnaJeIY7hL2
 yeNtuwuTv8aDExNU4hjhmkas3/1Znm9uKNA/qP8v+68E4Ho1Is4fxRB1z03ZldiG4tEJ
 o1mOzqE4r2OMCOK1zAyQ9AWDVmPQ0CE+jBhvONQqNZZif8aKDeSzJvv7OGGoc+fGJj/m
 R88WPPIwK+y/4uAapPpBE02Tt2UIqJi5+Wph60Tg3Tj+uD/mGak7qyuzHpXM+0bayUKF
 3XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772019288; x=1772624088;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oWYXEUEifFZBMHeVmrbJAPnEJvyyfnEVusXUsSRAp9o=;
 b=Qox2QEABRhRAZIoRMm1f4WZ3uM/ujyQE0hvImCiAq2gUAbB2JZUXcGVmiUGDHBufTu
 kiMm/BKJfGA5bmZl5rHreaHaYzA3Nu4IDqJ9TSa1nVaG28RhhMgfzvG5WjL5Irev/BMp
 jhgERjEfIY83Vg20zVpyq5EzIu2CS59OwL9cNOKnKa/bGx5KKZi1QBGlu94jm1AEqz0x
 gESfbsdAfw97bLWT4UtaAmz5nOiOM0xigZ0fXj5sC/Q7Ye7vEeENFA/Fj0cAVuk7ApeG
 LZOMSo5yr1hhbUBb4lvtsojZiT3rXgsu/DTJyZwQAKqo9HRlpn0yMLsrjlOoyRHT1JFD
 O6Pw==
X-Gm-Message-State: AOJu0Yz0V5ZMegtjc7YkThJkuHNQyai3PMT2DL2ahW45Pq+N7Gopbv9O
 Wgv6rBl/bY0iY2Ldng5c7AsEuJihi+SAqmomXj1J23Qq8xaF34Hsp94VYEs04yCZFF8=
X-Gm-Gg: ATEYQzzzi/ha/7OLkuumYrlXcyrQc8NTO129tN4rqJfbq5H0TDx25gVm9ImlfpAKpCB
 yV01mp4CwNNHNkrp4oRD2zcEPP3JbOfTl0cQwtVH0jjJc78Q7ZHura6JBFBovP+NnplLd8vDHUo
 bWaLjbXOWnZvsP/j98d7Q/WHzI9dTEYRTq5k2vYj4LNdtp8pNJyXMtdF7dG9KQl+iZKZCsIgO/E
 fjY7GTFY8CPqaydTx0rxwf5B0I/Vo1t0ZafNh5L1kZJZ0UfxKZ1+4Ev84R7jaofH/XEBiZKF4yU
 zAzqOiI4wQgedhcpLclEl1TkGvJ6nEwATLPLrraN1ADcED+W2Ca0U/SaqQykgl5ZBDpcuXqe6T0
 qjo3ItvHOwH3lxUO4Iuj+Kfp6wyerJgN4p1PtC9F0W0IctYlXmlidqh7KbIbxnmWRVvTDJ/1umx
 8tbBuR/zgfCSyFhBfrHD6cROTg
X-Received: by 2002:a05:600c:4f93:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-483aaa15e35mr278127835e9.18.1772019288137; 
 Wed, 25 Feb 2026 03:34:48 -0800 (PST)
Received: from localhost ([88.128.90.40]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bffc17dasm17108215e9.2.2026.02.25.03.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:34:47 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 25 Feb 2026 12:34:46 +0100
Message-Id: <DGO0EU9A2Y9J.32UH4T0T69JBI@suse.com>
To: "Jinseok Kim" <always.starving0@gmail.com>, <chrubis@suse.cz>
References: <aZ7Q-PB-_LV2K1xK@yuki.lan>
 <20260225112903.1978-1-always.starving0@gmail.com>
In-Reply-To: <20260225112903.1978-1-always.starving0@gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 1/2] poll: add basic POLLHUP semantics test
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
Cc: ltp@lists.linux.it
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.cz];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 6BA8B1968D3
X-Rspamd-Action: no action

Hi!

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
