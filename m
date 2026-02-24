Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ADMJy+gnWlrQwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:57:19 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97F1874E3
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:57:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771937838; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=bKiVt39s6JJ+fY5HYJQJt3cItXIHkz+Go0lTug80YO8=;
 b=PjOFNfiNM1KV4N2U9BiVz/xp/VD5brwSMpoArCzzaaAvO1bhmJdPsDfME02VJ581SwOyw
 dhhEnjUzyHzAfHZKDt8WcChF5ymK/rUo0IApdD6wAfslfLKtPWaVYSj3rLyUdUxDyygyhh7
 +xn9YwJFhTX3mptd4IIcv7QgkJfksZ0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBDB73D0F91
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 13:57:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A30B3CE6E8
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 13:57:14 +0100 (CET)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E9F342009B6
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 13:57:09 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43989bd056bso422171f8f.1
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 04:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771937829; x=1772542629; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4RsPDMgEL5v207i/uPRMkSbkSyJT+XYbYdy7JkUFYs=;
 b=d+ng92KjgohbIZhD77hn/cD0WW2N1pBScJ7tmOADWIj2CItvSbES6vZtXtQKcYBv0u
 Pha1M4UeRNJpLosDEEwavgZtNsKAQaxhjwHCFiO08cjoKZqCXSoMZT83KaxaAWVTIhpG
 cuUhSB2VZjAv7ymLIJtkWVp+zdLaB+9bItxTkkqisUBso5b1OAeY7T69s+kShiXbwOxb
 UG5w4e9Rh/jereIBdvXSxNwrCbv9RBXTOiJ/wxiO2n8Op39ZsD2g09K71MYWlidB2ANO
 ba7OWhrHciOdWWbEl1DfOuPdpPvyn0leeVWqx1/mV5hXPbeVmMbfM/7PWld2crIS0odz
 j88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771937829; x=1772542629;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A4RsPDMgEL5v207i/uPRMkSbkSyJT+XYbYdy7JkUFYs=;
 b=vgyiskgxIwVIviJeLsz2nrrdzQY9ijXZylpaDnwYTolOsNW6NIFLDblkF0Npx2XqOb
 Hw4iv0zxnQuFu7RdV/Q6WHGIA/7DLltwNjnHqbV6PBpEWKFQVvyAk5SZuI4kAt6rJRLV
 WM/G0eS6617potcot/6q4/e4fcdmwYn5EsvVawTjwDNo6/c4HOHWxYKDQyPZ/+gPwyKM
 Zif/MZJ5KNuyb4FFMpAZ90APukkK2qaBDX7F+A1d9qF+FEN1avUWFzJT9jCu5YyaDkWS
 Vh036aoDWXPDum6xGfN7rzlEpxT1MziOMvf97VMANMTy8CqAn7HIvwLBuy3M0amm1BNc
 OJXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvQMF1fdHspFpXEqrDkaJO+fBlG+ZUC28bCO7w9KHcfzn07L+eptT6JTi2rNKmTJSiJnc=@lists.linux.it
X-Gm-Message-State: AOJu0YyK25qKsbY3WLsdJ7tO0Jj6cuE0BZPDQ0E7rrMlFxowhQxE1GIL
 AquBzCVZhhEZlM7FlebAEhO5ZBgVhWUs87pNFltmOSxvFYaxZipdxuOXtsAiKRwMCvpN7KnBJGS
 +Cj/oOQo=
X-Gm-Gg: ATEYQzx30YW/pT9dE1PtSu2OlvmFkJ3350qcwl4GUuEsN6Y6B3oIFguTRY/+zoNyjzk
 Rn1URF2PklizGEq2IwyC8maRMUeqjPJlhZvgtZ6sycp+Tz3zvMtVSNMHWBuRO1/Ly4QQR4jUsna
 6PgAU8sqvQUcKHHhdMApAa0Md9NX15l+JsaTc9K1rnXHUuI6IyfxPjp/jhfaAoOcqoycdHAPwwA
 Gwhf8BKJztVMojtUKUw6TRP99Eu0tDNWxr+3FcSSc+Ue09MjpwA7Wk8sAkciuRhZ0jcLpVOpKwg
 /GyPoqWFEUkjvd+zHDqyEc2PmPkRF+9c2j6JkiJS2CV08C++Tf15pRGh+sAbWovoy7jivdcWrK3
 w7WYjoaRJFqUgslHVJfaDS4O7AjaF7LxdvaKLAHa87M0hM9jCM9ESGJaL8wscC3s+H7OPr283+B
 knhuXWwC0UfABhbP7DzEaMkcln
X-Received: by 2002:adf:f807:0:b0:436:1405:3ef8 with SMTP id
 ffacd0b85a97d-439625c9bc6mr22329984f8f.1.1771937829236; 
 Tue, 24 Feb 2026 04:57:09 -0800 (PST)
Received: from localhost ([88.128.90.16]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c96csm28822830f8f.30.2026.02.24.04.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 04:57:08 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 13:57:08 +0100
Message-Id: <DGN7JCR4LTIM.37JE987RI10B@suse.com>
To: "Guixiong Wei" <weiguixiong@bytedance.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260223031903.4037526-1-weiguixiong@bytedance.com>
In-Reply-To: <20260223031903.4037526-1-weiguixiong@bytedance.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/4] syscalls/ipc: shmctl04: Fix /proc/sysvipc/shm
 parsing
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 3F97F1874E3
X-Rspamd-Action: no action

Hi!

LGTM the whole series. I'm gonna merge it.

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
