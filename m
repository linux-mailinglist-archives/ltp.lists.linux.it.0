Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K/GBD8AqGnynAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 10:49:51 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE691FDE33
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 10:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772617790; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : mime-version : content-type :
 content-transfer-encoding : sender : from;
 bh=Fm8hznIo2bkf6dvVFX+s5c6g0zQ5M5KmQFLkpJI3gbQ=;
 b=oPR4wC28RPqg3fuN0FLv81x1aF8e/o4n7sgWI8V48iYq2Q4yjyCFm7WXRzSYegfZqt1iA
 n2GR3KBm/fym6etGKxX9BlMxRHsbVoCDEoK3rHSj1xwwYiGseaeP9EhhXiXy0/KHZVzcDB8
 pBgeSReVsTQMghwZziWiynq+7Zx1HBs=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1958A3DAD18
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 10:49:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5DDEC3C5398
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 10:49:46 +0100 (CET)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 026B21000150
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 10:49:45 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso49773175e9.0
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 01:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772617785; x=1773222585; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:cc:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aVGZHEP86WE2gKvm2ngRLqeHDph87+Ru/NK4hIsbWNM=;
 b=NYY0vl1aJnTg5noZY3i0tMFc+g4F6HOmOr4EonuufhDvJv0rJ4//7V1hIsK4notF6A
 0Zob2VrzW4pA7gVNDNAYWE+UR0IYd+54Azd3Jd7eRzTthPAVApOEdzdRURAWNR/NO0wL
 8AkmGARrI5hAbloFoZEdZzCIfb5wJuu+QYmsIWQ7ytCt/n25P9e/0IQioc44eKLQD5q/
 mfuyjWWWGCxRLlbnnoPJx7BeUbj67XIOsS8wxa2pjGCmuyspOBtLHJOU4SCQyIHouQKb
 2ltJXba7CYjbFy9Kbq3MAdb3EbbwGuy9yQHn9DfEA9axdoskgHUeE6CUKwJozrw3BY/I
 vBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772617785; x=1773222585;
 h=date:content-transfer-encoding:subject:in-reply-to:cc:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVGZHEP86WE2gKvm2ngRLqeHDph87+Ru/NK4hIsbWNM=;
 b=eegoBl8GtSJr2Ixbyalc7TqYmBc+WjiFiD8enl0Zk53rljdqaiiPjNpPU8l11TTuj1
 MjrUjsHvYM2d1mvQoty07GavzRui59A0rbUMLnPCEPLmk/dFqd0u2t0mohsNH4TaWdkH
 EAQIFirsCQxOwbHrpik40Y68U9R19sxOqsQFBZq8Gw8NVGUthbbJV3ImI4s/3+fL2CMZ
 IM/TzDwdFD8rCqhqvdzvFrod+BiAVnUvfROMq3CMB8zN+72sIXAv1m1pRC2uqZqvGxgi
 KWZmxOOOM4GL0AVi/VTDXGcXA+eoTVhCsRqGKB8RUNa+lq5P57Rffvevtte8/IE3JrlW
 ZwIw==
X-Gm-Message-State: AOJu0Yx6VZBQ4mDfmF+NVjlo5PX7FEppOktT+Zkgj81KedHfAHZHS+2S
 UJVjm7CrweEnYkP89vD8u3u9SqOMI8NR46DBppRhAveVOFWx8hSVzoaijQVUjqc/wyA=
X-Gm-Gg: ATEYQzylrCGBk4sRpn2/CNyX0SowFwAOLD08tf1u6NYjmHL0eYfJ7XVQlbd38FQbGDn
 9DQRqnohkifrsN8Ys059SzCdiKBkLxxegaob9ClyvkGiTeHEwm2L6bNILazh1EScdyAWtzcpz1g
 HJoo/wnWUmU7hpRwRGbPhJxiZgbk9SpytsRenW3GDfMiGSJ9AgHdZihPThqeaPvh9inrI/M3roI
 UlAUHbAvDuzfOORKrKxd+1yOoCdfgaJ5h8auagiC1FmEB1gt6Ir9w0OwJrXMjD6WTYuC6tK9EgF
 vAggl2VwGSoEzdiGaxjj4dd9/yMj3mviCFHz5I3eeC3sPiBxgM49YPzAUcNMCAlriJvK7e63Uzb
 /ixqb/jsaEXroiGwf8QWdkXaXYlPDX/h1HysnBBruvzlygKB1QIQx0aR7motyct3EDKqdeexDpB
 TRl9ILvMKK7JBjOX3Adyp9sIPqWyim3RReTNqtbc4Wwz9+krC43sjLOLveeno5bQ6OmSAmh/pWe
 5KqPsreIdCUsJ6QFgzYFjCnzMbCVnLwrkA=
X-Received: by 2002:a05:600c:8105:b0:477:7bca:8b34 with SMTP id
 5b1f17b1804b1-4851983bf08mr20111605e9.6.1772617785336; 
 Wed, 04 Mar 2026 01:49:45 -0800 (PST)
Received: from localhost.localdomain
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851884224fsm38677685e9.4.2026.03.04.01.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:49:44 -0800 (PST)
Message-ID: <69a80038.050a0220.3816e.9f0f@mx.google.com>
To: "Cyril Hrubis" <chrubis@suse.cz>,
 "Andrea Cervesato" <andrea.cervesato@suse.de>
In-Reply-To: <aZcCrH2i_KFhonAG@yuki.lan>
Date: Wed, 04 Mar 2026 09:49:44 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/6] Add safe macros for stream testing suite
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 9BE691FDE33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,picard.linux.it:rdns,picard.linux.it:helo,linux.it:url,suse.com:replyto,suse.com:email,mx.google.com:mid]
X-Rspamd-Action: no action

Hi!

> 
> Newly added safe macros shouldn't add the cleanup_fn parameter, that is
> kept only in the legacy macros that are stil used in the old library
> tests.

The problem is that I don't know how to approach it, since the header is
correct, but we also have tso_safe_stdio.h and there's a mix of old
implementations/new implementations mixing together into tst_kernel.c.

I'm a bit puzzled. The point would be to move evrything in the new API,
including the core library.

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
