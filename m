Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJQMLEJJjGmJkgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 10:17:54 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4351229FF
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 10:17:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770801473; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=8+08UWrrNkT4YcKJ4ynmpWpK0xtc45hoC9drmbIbgV4=;
 b=GQvT3WwDoAQvkdaGe6lw76o+0uwjT3R+qr3WZkexdqrtCoxz+uF/a16xF5G3+0TD3eKsM
 vjnM7WLPO+nJ068VLXszQkCC1C7tgs+UEYBWGDIvzq3FaUSxqNw1XXlS1AnE/nAywvvI7tj
 ERXuWjRqhv3OTmnZsMVwulzWCqcTAnY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A7453CCDDF
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 10:17:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8AF403CC237
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 10:17:47 +0100 (CET)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3AE521A00A26
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 10:17:47 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4834826e555so27266475e9.2
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 01:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770801466; x=1771406266; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRTi9FyXH3bMBKkNlpmLY5er2r+ce5WKA2RhAKRQtU4=;
 b=AABt3v15LN6SgUAyFlMdB+0pTyClwl7GPYstiyZXxC4hrTfgw5yHnrdp3v7BYR7DbQ
 8havhl2oJwuEnZVScs2vRyCT5Wqzu2X2Q1VnnWsEvPUnGbyp6RQIazmN0RGtlsjhh6zj
 A64kS99opofSn9AtqQqq17qiu+BzhXZ2NtMImQwyMEws/X5E6PrNsYfO0umFoqMVPiv1
 sXmEHo5n3CkbLEfsLvZzPvUdL8LK8xTqJL1pYzAVfcOghdZ8R64UvFV2RNXSEVC4iAYI
 T92TtBYaM653oKuiGmSdgAslWGgmeYYdMbLSdQ5zawR5CCddPJeUAbrLwMHAyvAl2dAZ
 oJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770801466; x=1771406266;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MRTi9FyXH3bMBKkNlpmLY5er2r+ce5WKA2RhAKRQtU4=;
 b=gjMJEgmvHWt3DoPdLgiMnFF+cu9tjkpVdxpi+4ME/zlsK52e++vj+cCZi38LpcrvOL
 7iewFivpqyksqgMOxDVrdL7p18GCDv8hq4CNYX1Ai/4uASHuZ3D1vxvVxP4TbvWCaoVr
 iKbluFDI1bMHLZUsOrbT25LB1sGDpp4GDApwZ5mWt99+yHCBeFf1OAQIpj80+xD4ha7O
 v28pa7LhBcST+zs2PJgX65SL4HeD2QLsDbIL7FJPYOM+3rZVo3RD+ysGHx6pRnfY4UO0
 VkHFGtStN7uhYzwCP8sTFEpaVuwUnhqdG5KUZgktxcfuwqs/PGO5DmIXt19Y4fmeEgBe
 wADQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+ZbifgDyxFAZJJLkxxYGqePA2FAYXSJ2BrtjRW2MaO4NXfvR8i5NjrbptypkBPdSjAjE=@lists.linux.it
X-Gm-Message-State: AOJu0YxaJ5v30Ko7BXe2JWHJ4RuvRyfoBI2OBzy/o1qW/TmkNbFfEG8D
 qeKlf4P3WszH/4jhar8R680PV3NIcie/swYuZidca8nBpJHlyLoPMb2GvX7KD5XVDuA=
X-Gm-Gg: AZuq6aJ86VNvkxE2xtPdCjZke/aN5kGVgO6ukZ4/sS3KadjQRqRulQuNwY8EYfrzycp
 8V5acrG302J7MjNVR2oslovBBhkq2pEHYwcic8z6xtERPTupTn6TDF7scapxRfiw9do/AgLl6MH
 l52fP/StZalZ2tEfy5J0gwdpMnNp0OPmrRxFrxa47HfeehSmvg69YuKiVMnpCAzkKQiVT8lfuUW
 aoxblUUYB6Y5MHObUicCBwpUl5p5HV3UEZWUOCXFSdts27rRafhdnAncQ458pJZGOqvPxGy8gXY
 4yyZcDw0G9XHgAtUtJRsQN16+IQLm59wVN/jlFpdXECQIeB9Z6srcPcdLb/h33lVlokm9fZQV5y
 sCiXU9rkEAHh/KAspPlibWbf9nQmwEk0t0u+49QIBRAnmO4fjH99C2x1wmfwZDXqQYqfF+7xisg
 VqF5Tq/XGmvZDC4RiEMsnTZJtU14gHTmgpc+BRuYQiHqOF3pPtFt7tF5wQMBxKdAiErY35aAQnO
 jDuBAKr0GWZeAETTJrvOu8ZP7oC1w==
X-Received: by 2002:a05:600c:3f12:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-4835b952486mr21248025e9.22.1770801466375; 
 Wed, 11 Feb 2026 01:17:46 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e50casm107892645e9.8.2026.02.11.01.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:17:45 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 10:17:44 +0100
Message-Id: <DGC0QAGRNIIM.GU4EHKMGOGK1@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260205121540.329921-1-pvorel@suse.cz>
In-Reply-To: <20260205121540.329921-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 0/6] Remove runltp
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
 Tim Bird <Tim.Bird@sony.com>, Julien Olivain <ju.o@free.fr>,
 automated-testing@lists.yoctoproject.org
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
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,virtuozzo.com,sony.com,free.fr,lists.yoctoproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 4E4351229FF
X-Rspamd-Action: no action

Hi!

I don't know if it makes sense for you, but I would implement this
before merging this patch. What do you think?

https://github.com/linux-test-project/kirk/issues/72

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
