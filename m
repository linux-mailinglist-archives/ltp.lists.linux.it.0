Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A4cGHprlGmqDgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 14:22:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40114C853
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 14:22:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771334521; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=Hpwlsl4R0tQa8al5ShZKjtqOm3sy4aOem3i4p+Poo5E=;
 b=I3HbpnxUd+WN+enfHSbGkzsFnl4AdLsfb1SF8ljhzuy56tkTcWf945qdvnRdsxAh0LKFf
 QM6OjMZD5S7TezrIyUqvYXpxYhgYjRN5omE0XZuKt3i/Elc89tx+i+WszQkeqa/VTgpJSY9
 Cu8xi8+kmUNoxbfXcUJE/Q1Z8c8ZAEE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88D613D0628
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 14:22:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 525623C5720
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 14:21:57 +0100 (CET)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ABA2C1A008A0
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 14:21:56 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48372efa020so30453595e9.2
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 05:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771334516; x=1771939316; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWYXEUEifFZBMHeVmrbJAPnEJvyyfnEVusXUsSRAp9o=;
 b=IyOk4pcFTDNctwwzYdmAMP/TZGHE3BIjAXlOmsAhgUEMoBEv3uSwyCCajKM4QP7QTD
 4pCou661jzbBz4s2NXcLaghkcPObDgJjyjoiHqvCMbwQx/SEkkv2gb/zkdJcae/z654U
 HjBisFhm/XohqaW3cDENHZT//FaVyFXyr0FBY1XL29GmW9REo3DKJb0xdLdBIfSkNd1Z
 JaN7qwGoT8OheIhJz8DVsW4LdR/PBFDDBvlsnYa1XFNm5hwsqxF5aRPjHRW63T+G3vli
 lPJo/t2bQENPCeZ0KswzGQtLlhJwH6C64hlo9Vk9yBLNXroE8JZZw3mNCaAcZ55QvXw/
 Hdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771334516; x=1771939316;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oWYXEUEifFZBMHeVmrbJAPnEJvyyfnEVusXUsSRAp9o=;
 b=XGXjoT7wZLG5sYRJZGWH1piDdQ4jMhdSSvhdAPpQoKUxizujxymcdMQF861yjhHdfR
 l+PfprGxRYNEaA84NddpRtbpXFGdCgTT2Mt0XM9y6LhEajsl4fRdFG9YVOxwi98oPtME
 Cbc5wV2jNmBnxFLAc/ZsB1a7YmbXSXzL6M4i7z1WrXOR6CB2d3Rbvc671ot3pKAofb/q
 m26cLYbOt2fchzvpR5sc0rMge+gSWVrS8wRd86JkcP05b072y85om09mxr+XHEYQR8lT
 KcB7S+L3+vlJxK39P0Z4B1+PVRNeAWb/yWvhcynz3x28NEyCIKgFamDdaRjk0lTOyx4M
 TyGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWemvsunD6+zv5NUYeFmH3VbQNzQZY9c3xloVu9N5SzjBZpkQ/EpKdtSjYMFWqp8MwbHiE=@lists.linux.it
X-Gm-Message-State: AOJu0YybRB8Lb6iUo56hGpxM9c/5FzvGQuU7lyiBdaooz6VuscaVnEJn
 ywsbWkYuXWhkkVZNO/AGBewjtc/mjmP/R+tlZOVJTBvcQ92Jq2+F1wj3QFpWHJNPnvI=
X-Gm-Gg: AZuq6aITR6wXsqGzttS6IdCZMwoEQvYOYnMi8J+kcIoxnx7sLRgq82RHTw24mV8NzfS
 koExAymz1AHsoxv6qJMEfguCoEsREDR6Gm9lTn96A4xPXyiYA1q2ejz/Wt9z05/Lqe2ooS2L7pc
 GMI6Klqx2Vxo1QVGkcXOEHB/f02GdjEZ84AsAq90kIoNICpSFcfU6YVZ0PYH9JqXnZYgBY6nxM5
 otbaWoHq8mTZgOZ9KbFkJqZ4UmnWFszJgTcozhfDuvNVSnHSUtCorQaBm90JoVpQtXWXxf4zXrD
 LDFcYmXHZUkAqJPdwUOzHwlyoZJa+WGTONQJGKBv0b4EkLulFYV4T2dUa1CgLjro1uOJzKX00o/
 SKujItjRvV6L9uxPLUDfhKWaPhccDwuFrJdGfe8cDBpetnNmF4XSFM+CyzBOoCPueJHn+JzJbgN
 MBPBfQy07x6dOwN1wBTB3eWaE7VVS7p7pulrrIN7PA9msG7zhSAIePm9uZnu/DfdBlK3cZftc0J
 GjHJJc0LZX1i1/jQjg=
X-Received: by 2002:a05:600c:4443:b0:47e:e20e:bbb0 with SMTP id
 5b1f17b1804b1-48379bac837mr170666905e9.6.1771334515850; 
 Tue, 17 Feb 2026 05:21:55 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d994670sm406437085e9.4.2026.02.17.05.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 05:21:55 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 17 Feb 2026 14:21:55 +0100
Message-Id: <DGH9OIF14XW0.15275C00XI921@suse.com>
To: "Jinseok Kim" <always.starving0@gmail.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260211171627.11410-1-always.starving0@gmail.com>
In-Reply-To: <20260211171627.11410-1-always.starving0@gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open: fix directory verification and misleading
 test description
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.it];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim]
X-Rspamd-Queue-Id: EC40114C853
X-Rspamd-Action: no action

Hi!

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
