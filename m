Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIYPDGqhlWlcSwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 12:24:26 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B4155DEE
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 12:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771413865; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=x5whaO3yIJzFR2/cjW7HH8f7zxb/oBBei65bycfj3no=;
 b=asYXw3rCQqf2FaYMrOb1Jfa7V+TcCByBIvmja0GB3EZ8wW9TYlwmbLQBdFTwwoe2dB40q
 LxGG0bOUd9tATDcd3nmDiDj50ZZ6SLX6C8w6yXdoGRRswCnW0USoRk9JZtfPBHSQzdZjAHn
 hMWme79yjVMd79ffRjlr1as4XRapak4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB60F3CB063
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 12:24:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E2513C65E2
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 12:24:23 +0100 (CET)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 844E2140012E
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 12:24:22 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so3970831f8f.0
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 03:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771413862; x=1772018662; darn=lists.linux.it;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5rKEaRM0Lo0EIU53lTYzyxiwqF3MmsIvG2tdQpWxU4=;
 b=gj7OwbmOrqNutasmwpWjGNP76y2umTgAircC0WvkyLMvi/68DPJppm8kHCwMT+jpFq
 eOXelMqpXghC+WRWdTszUnhVpvr5xReUeOwNaRrmWY0UrYxrFeKpgzlyuZEvfrOEyPOH
 lVAk3NbRKOt9+As4Do+zlaMSqz3AQh2OQLvjEZ8gSrHkMQC09isbtIDR5+a+KWw1hvGe
 mPzQXYeaRNkMIAsUGmaiAZ7UCO9oxa6ag5TWJBRBLcW5+Gm/DyMHjxaA/sx9Zf6Y8rd2
 kd6sz0ae672U/t3nZWoKEZl25uvcSwMjda5cpzv6bFFW4ipan41A5aARn+zRfvvJgJbk
 fWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771413862; x=1772018662;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k5rKEaRM0Lo0EIU53lTYzyxiwqF3MmsIvG2tdQpWxU4=;
 b=mIUBneR6yp4zc8xdH1lSBAsXYqW/rRywXnKorrsRUI2QE1/gaHERxe7O8HiiguMjLM
 YlK28fxnXANdPYy5fppfiiBhYdr7oZzeE28KgKBeppWQk+jgsleTxTpiiKFs8lvDfUWP
 D9KCxF0WreFuYZpgKukBaDg6jRbfGjjuDyXizLDbjwds/5j/nK/ZJ9PksjKr/w0/7UyQ
 2zZhU1KwByPYVcqdkNbYkQp/WdHoZVwqoiCYPWUiL3OsF7hJVYLk7MCmxUsEDlvg+8P/
 55QqqPYO1BQUmOUxrT7Z8xNheQBd4z/C/y/48CbIQFbED1f0xeoK3RScfXsy2UNhEgBC
 XAPw==
X-Gm-Message-State: AOJu0Yy/gquNXfmzQszrUO2JAwCbY1ZGxZNyJufmPNipkSvbzCdv7pBd
 wRx4KKqFO7qTQAxGGbv4ObtYd25zUq9npCyrdjMi4No2RXzTwuX1H8wSGl/Q5PMmJ2SRTKHI6+S
 WMknqlJE=
X-Gm-Gg: AZuq6aIdelKty9DZx7Lrj6W/vtfcmXAE+8utSqaB148z5wAmDT+fP9vdFNavRoJIYos
 3zePgnzC1yV7swsUkwQ0yRl8OFpNTxoXSxmqoNA+zpZy2Jz+88O+R0qFRrooeWgNZSbXnXyt/z8
 hmktopHnFxTESh7dMdtKQE53yOSnXHLy8h6RYEO3HrxTotEST+JPb62R0xK5gQPLRermH6WeZMh
 GB6UeQ3iA53W5jC23vVqMf/7o2RFABu9D24vStx1TdQb0A6EJZ+P0qBEmKBWtQzDRfBvDeTNau6
 CK+/UmZhsNXbMKvK+Z9O4Rlsl1beKYrZYlDEKj3RkZFBOttTXnOfdLuSiaZLk7dLDkrd1oiGWFh
 Tkx07+PtINt1JsXQE6hp+pqM3f8ISzba5HEa9HFer6IZvprOvg/Q9t8n7erBtpl89LbsYiW62Fs
 7PtFMJCcw/WFtlqiUcu/a9hk19cPeaRvgVh4xphmH2qmpPZgRORt7ST7R4tRS90q86dHv5A70Kz
 1z0kUj4mxGTSF8M2Es=
X-Received: by 2002:a05:600c:4104:b0:480:4a4f:c36f with SMTP id
 5b1f17b1804b1-4839b4c703cmr8575715e9.21.1771413861769; 
 Wed, 18 Feb 2026 03:24:21 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483801ff9b3sm296293465e9.13.2026.02.18.03.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 03:24:21 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 18 Feb 2026 12:24:20 +0100
Message-Id: <DGI1T1ECNGG3.2GYTW6XD9IX4B@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, "Andrea Cervesato"
 <andrea.cervesato@suse.de>
X-Mailer: aerc 0.18.2
References: <20260210-fix_cpuset_memory_spread_warnings-v1-1-3e97d58e35a2@suse.com>
 <aZWVX9Rlf966N244@yuki.lan>
In-Reply-To: <aZWVX9Rlf966N244@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] controllers: reduce number of warnings caused by
 grep
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
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: BA8B4155DEE
X-Rspamd-Action: no action

Merged.


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
