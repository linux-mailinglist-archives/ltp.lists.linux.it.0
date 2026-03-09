Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMGnAOfdrmm/JQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 15:49:11 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068423ADAC
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 15:49:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28E0C3DD9D4
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2026 15:49:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5DE543C198F
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 15:49:07 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 11BCB200912
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 15:49:07 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-2ae4e538abdso79539525ad.3
 for <ltp@lists.linux.it>; Mon, 09 Mar 2026 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773067745; x=1773672545; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHPBYp5AZpX/0AWfNq6WCaf9VPvtx1yxgsyKF0xcQ8Q=;
 b=EYnxypZEKsm+E7LUTlZmYUGPhM56Bn3jGk4fcAbJPGK732jDdAP0YFlqF6/BS5cYsJ
 BvRv4x5tpGTE/piD6ABSVNwEVjdslQnSbhnpjbeTueOse8TtSEWeVHA+ZLxGDEsygeDk
 x+l3+Xd2Tx7NQ4QR5fuwEzm8mNoKHMAPe1HdjoQnVvGgg6p3wDme6KjOy6oyPyWEXCXV
 bnVxdYkIZ5cUErxu1XiOOufHZNfb/rUjgG+ITJNHBApw6n6KUb9bKjyF9ReVBajp52EL
 5ppr+6DbtwKY8foAJ0Nd0t80XgBrWSM/48Z22Xj2GNAsDl3oIAaowl6Vc/1vDCDnyih9
 T3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773067745; x=1773672545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HHPBYp5AZpX/0AWfNq6WCaf9VPvtx1yxgsyKF0xcQ8Q=;
 b=hbXxo2SD4GfX665z3OeXE3Ol1PZBBVfTPuhrT4bEDIogI66bDrUcYkXw/4wdTQlXV3
 vjEUAz6s1YAqhjeOZqTRjk30eU+UnCCwxk/7LoHUZMa24efBdWE5WKpzSTBtDCMz5Pgb
 URH8xoynPF4w2QCzd56vVJLFJCWArJZVgYERl0NTjyUvZHp52v9xp/O9MyHyusKFU8jY
 tnMQSipcZlhEMH9FxV1eiBG8wsR85MILrCijjTX8C6BJ/I1gM/Hf4TzGXMTQ7A9PwfZB
 acGo7zlnJty715ZoJ4NquRRbu3JcmPLvWbkp8THZSTgsQ4cOWWGreezJY9KxjLAo1Ufa
 k73Q==
X-Gm-Message-State: AOJu0YwpE4UmkicO9BwOZmJY/2ryClzr5sa5y1/gbpakut3Ef3MIOq2F
 5NGo7o1EpVFgRaQbqV4bIMER8wftrdOqJ31etofynVn38aBdAvMxlzW6ZsKmNj0=
X-Gm-Gg: ATEYQzwhkIuORqrzAUklkmU9vfbb3hmj1I4x+UMzZAgMxI1kC5SFxxy7xuzZI1VYpSx
 JrTsWZgbrRJOK/oHH6hzq9HNltuSvYeePY8CjLpA3so7pe4iyduSN1uELIJlhSTqthzp10PBbfn
 qb7pF6D4eXhz8WIcvzIt+a9jdWiV7DLEOxUQrlnPblQn/2C1+EFMxphNwm+QAOIscwPS5MPuJjN
 v2om2r8xdeUr7/hi4x6/powRB7icm0EO9m9jx2RhG90xKnWYlPdnbT917e371NHBitav3PJH8gO
 r4uIFr0uAAn2Tmy8vpn7QxS/EFoCuQBf/GyCWRGb4irgmK9Kp8rmRj+Qa8RHXykccZSSFnBjLgr
 EoGyG45TR6/Ndla0E+TECpRx8FAP5TPc6/xqAoJvXXUlb0oSiNYBEEdHTPxyvJUOHLA+PBCwNxN
 MGdiUjANiXNTe2qVGG4A==
X-Received: by 2002:a17:903:2283:b0:2ae:5223:59ac with SMTP id
 d9443c01a7336-2ae823849famr109551595ad.13.1773067745430; 
 Mon, 09 Mar 2026 07:49:05 -0700 (PDT)
Received: from JS.lan ([171.3.84.26]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83e57b1fsm157941465ad.12.2026.03.09.07.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 07:49:05 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: chrubis@suse.cz
Date: Mon,  9 Mar 2026 23:48:44 +0900
Message-ID: <20260309144858.717-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aaq6eVykSC-dSZHg@yuki.lan>
References: <aaq6eVykSC-dSZHg@yuki.lan>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] inotify: clean up build and make check findings
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 9068423ADAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_SPAM(0.00)[0.700];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:rdns,picard.linux.it:helo,linux.it:url]
X-Rspamd-Action: no action

Hi,

That makes sense. I'll update the arrays as suggested.

Thanks,
Jinseok.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
