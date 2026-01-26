Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AXzNCoqd2mwcwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:47:38 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A68599F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:47:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769417258; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=0PUkcZmiATp82mj863foJLlX7SOQYnDAtRWyOqyOJSc=;
 b=e1931bIRIYhB1ZgD5uggvseAuXpwfQbck9rINbbiDTsL+G3oVcrqjIpGr9mXO4Vi8GAc0
 HpHnxoGIN0F5XH51Z1k9MuJsQdG3uq8GAoWUCAwud9f/yi1JmrXH3D1miWQQnRxCV726ZUM
 raO7i4fYLFh9m5B+8ky/SrORDBGyAw0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 223A43C5489
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:47:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51DA93C01E9
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 09:47:24 +0100 (CET)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4265C1A0068B
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 09:47:23 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so48787385e9.1
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 00:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769417243; x=1770022043; darn=lists.linux.it;
 h=in-reply-to:references:subject:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yj1SmcJgNxrvHY8Ht7XVssrnuBrCLqJhe+LhMIBhyYk=;
 b=XSc8bAjx3OKkLj6x+8eHOWwfP7iArl3PdSrbdEB14UqpGeE9NkicOZD1I+K3J9LCop
 z5F/ttpmA+CoVA0OH0RmxJJJszTuQSzYxj3GkovSxUeOMkxvgTVMVe1FAzI8WbV3Nona
 mytRCTfRFP4owfYxv6H3A67CuHSP1MwHS4F3F54etVgE8crrFeWK4ykf3XweywxsgiHW
 VyRd2bRyIL8nX767PZQmldoXp2smWiqAxdD+SpkSXGwLwUc4y6Gp4Ry4eiNKiBCOvNe6
 6RJLzU6JWKKCkY1u1EJ+3Ow8IRtk2OOlCBfrHoc6mmF08y2DX20Y7UUaS5FEKlKCP/vD
 FW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769417243; x=1770022043;
 h=in-reply-to:references:subject:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yj1SmcJgNxrvHY8Ht7XVssrnuBrCLqJhe+LhMIBhyYk=;
 b=oXVphiWJn57O2tTMtn0tkgGuOz/O9gDVxct9jEXilYsZ/WPWFFTAzviMYlQJCxA73j
 JYXPWO16VaSNyAusyNHAD+x1C/y68lSB3gUcqSzCDbteRovcVa1TDNXLq3aUweiMH4yq
 FcHTiiKzWgSZfX247DE84duBYcOM94h+jwz10IYHZFgDSLHqSYLMWnXqM0s6xqIwJWu9
 QHlcMyJwc4doQCv8ppsDZ59CK9jLMlQsucKvvfzO7ihSD5wtSW8pu5RoZu2A3UrG0eAs
 IDiO920xpa7AJ1T2fM8WUnnsFSzIEttI0aWcH8GTmPtJQF9F/OISF5uzWkrc5HlMrtdG
 7C7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAs1RZrOvO5mvjIC91X43n4KvOwmAv0W6llNxNv9mzHp3F+0CemHK8Ftl/tcOY9Pt6evg=@lists.linux.it
X-Gm-Message-State: AOJu0YykXVXQnMLZURdaEDZt2GCtnpjnUNCHm5Kuohk4b3EufBy9MdEF
 KseF25/A1vjnq5GTB6mdC/neyXV3aAk0BdK7xrZjrwuY39SFqySWp2dbpezgBjtZeT8=
X-Gm-Gg: AZuq6aK/HCMny70nQKfIguE3bDjTTZLyDqlCEhTaeiUPNt3Tcf8CxZR7CYarjM/Kll8
 SNYaJpvs4Eem0O1JzPGutULZVm0ocnhbYznjo5CdbzPjfIhJZoykcGqaM8V5ROS4u7+r3eDhLYo
 pQR4/HQWVEzYlN+kDhfqiJFqOvE8shZX9P5op1Vr7okGY/Viwn3uOZjrriK/vAuJF1wTEo9iiEt
 +9xXNmLhPm5fOqHQMUfTYTDUbUhPyIUl59oX1VZiF/nf4amAWPyGvuMs0wnX2P/uBpJYRJ+dzRD
 S0MqbqKcKUhLeJCOGEz9nFDWLcApWCTuVdrcnbMpU/kqXmAf2Y43lwe/CnGYrSpZw0R2W/Tpsxe
 ySK1K2dEpKVPyc2Wihd8z9j8LUExJVdP78gOXUif/pOpDEpwsNgo0K1vvSshYD+x3k6L+zUR3NT
 2YDi2ZkXYkiljfGPEMMGrMetDoYSYAuyIyB8cIF68Y7R2gufYXK5PZtLCMOAzqDXuBVuZCzMVri
 3UO5rg=
X-Received: by 2002:a05:600c:4ec6:b0:477:c478:46d7 with SMTP id
 5b1f17b1804b1-4805cf5f167mr62374555e9.22.1769417242532; 
 Mon, 26 Jan 2026 00:47:22 -0800 (PST)
Received: from localhost
 (p200300ef2f1649001c626999955e52c8.dip0.t-ipconnect.de.
 [2003:ef:2f16:4900:1c62:6999:955e:52c8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d8bebfasm298722115e9.14.2026.01.26.00.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 00:47:22 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 26 Jan 2026 09:47:21 +0100
Message-Id: <DFYE2B8PCNRI.C7NK5PJU4YW6@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260122175354.83833-1-pvorel@suse.cz>
In-Reply-To: <20260122175354.83833-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lapi/tls.h: Cleanup ifdefs
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
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
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
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,suse.com:email,suse.com:mid,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 770A68599F
X-Rspamd-Action: no action

Hi!

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
