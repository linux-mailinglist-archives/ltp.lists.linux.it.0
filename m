Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHZpFOlPqGmvsgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 16:29:45 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9834202B05
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 16:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772638184; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : mime-version : content-type : content-transfer-encoding :
 sender : from; bh=v0dVktfoJ4TXRBqZM5iRX432azc5YuqsBWCyzOc5usU=;
 b=DCWg5uV/L6Wl69WAU7KjJscdy+usSaHhqoox0T4ceAvVz1UWT9S60WckzVUj5gbNLhRxi
 LRW65FEpyw9pN8sccUwtRWFodmQCAqXJCLSrKFpDNPtgqX/VH96uQj+mb+Cz1FAoCJZnSVF
 wPS/C9n/Khtcn5RJRvOGBpNPFQvWiXU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 756453DCE2A
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 16:29:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F8E43CAF08
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 16:29:33 +0100 (CET)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F1126600B4F
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 16:29:32 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439af00d33cso3730424f8f.1
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772638172; x=1773242972; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1/0JKtWz3mUT1QepXprGUJqfGUajU8B/fmkkMf6iGXA=;
 b=C1rqgSbAldOzzN0XIOEFMc2kc2XWI5M7bExm/EmF4OsGE9u83KMfqmT591BVK2cUG6
 FJqXWYPtU6fHV5E7OoSm68KJ+ExktDE8W7N39koyWBpyGtE+RXqRHZ0wMjA/bZFMQYOD
 KExIOIuNiSvi2BsD2JFpdnhSJ2T+3XwtLBOgVNO+JjJnbS2y70/LGEbtNm9XZJLugts/
 NwjxT0jH04kAM5BUZd8Z6su65nVop94JS+rs8JrAaKgOVGUJ/uuoyWrb1eJnu1XUWeZa
 duO4zG1PMsQe6hwtlNAQcn/zHvSmJXiEqkeRzR+7XYsktJn8BghfrS9a5SQ4C93pFYl1
 /aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772638172; x=1773242972;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/0JKtWz3mUT1QepXprGUJqfGUajU8B/fmkkMf6iGXA=;
 b=KAEsy8eGGvZWj2TSRUpA0FV4lqjWOca2OwdniPzDiac8PH7gVp/CJGUF9mkY7iIxo4
 fmpA9BIzHH5W0SgmqnD2HV+6P7s2dO7+wMgB0/1wySKY8zeIxmYYRi7MdzhReU63MVeh
 O5hQjTXXOGYh+BCinzzLLqfXJMvz5RIuA4OltagIlglA0P7/fLTzeVn+zM3AQuVwXHAF
 a3n2YIwr1Kr2aEwWhvvt9l1nUyDFHY0RSp64+St9+k7ktjwrwk3ErpvPzLNu+OkKsJ9K
 09aHS4dYMDsG1Fmiba2VcgJFk9ugz2egdGiTUNIjaOuhQSLFBpeNLm/1d2Gq+V3fHPkC
 nm2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKgQ3GlxTefvdKbjYMjr6GNKpCWzyXAq0j+U+lEekGHt6q+IsP/OTwmfxDeMYWwxubh0A=@lists.linux.it
X-Gm-Message-State: AOJu0Yxi2yUQY2tsKfHOOETi0CI+/fJe51OOUdPjVYF+ObqCBqcN+hfj
 exEyAAL/wInxKlhQ6sXwBeyzWhTRl8DnmX1EekxcKZLWloMEFOsnexc6Y5ZIZAK8xX9MxiG95Wq
 xInd1
X-Gm-Gg: ATEYQzxiNM7p9+yurYyBUJESVTiKc+wXQhxvDjlwcpZJQdaOtkFuBaxOfO992CBZUvg
 X899S0lmT8uvO2j9glUjrhswcFyo33EnXWE8F81jNmQEjN0fjScWZx1VeQCP+8YAq39KNOV3isl
 tYGi1zgxtwxVSJRVhMT0z0CqGA+AZC0tA9l+64luVlLAtvGJbyDUCNdG1u090sb55mAcJRGDBdo
 3QFQppuDypXChvibqKzyy8xYDNy16CTKcw2k1kHu/R2BvvKn4/L4Hpp1qDSvSocfKPjKVmQIQlC
 1CvO6VjdO6a1UsLqbUuyJhja3AXBOOp6BlGXNgMvvC+kjD2m5AUZf0cMxPkeg8gZ/W1JA9yjs/x
 Xc+WplR9r8ZCtNTOj0lAikY2SuQ/1px82yKdp2YMaemdSN/R3cDnr+u/oZB8ArdqGetKAEmf2YB
 R4T7aqMc0AQ2P257dMbhYnHo623ajCfpnnqQT6ZglZ
X-Received: by 2002:a05:6000:310d:b0:439:b114:60c2 with SMTP id
 ffacd0b85a97d-439c8006d49mr4363260f8f.34.1772638172202; 
 Wed, 04 Mar 2026 07:29:32 -0800 (PST)
Received: from localhost.localdomain ([88.128.90.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b41831easm27322119f8f.12.2026.03.04.07.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 07:29:31 -0800 (PST)
Message-ID: <69a84fdb.050a0220.18749d.4545@mx.google.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, ltp@lists.linux.it
In-Reply-To: <20260304141236.9080-3-chrubis@suse.cz>
Date: Wed, 04 Mar 2026 15:29:31 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] syscalls: sysinfo01: Rewrite
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: E9834202B05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
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
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.com:replyto,suse.com:email,mx.google.com:mid,lists.linux.it:dkim,picard.linux.it:rdns,picard.linux.it:helo]
X-Rspamd-Action: no action

Hi!

> +	sys_load1 = sys_buf->loads[0] / 65536.0;
> +	sys_load5 = sys_buf->loads[1] / 65536.0;
> +	sys_load15 = sys_buf->loads[2] / 65536.0;

I would go for:

	sys_load1 = sys_buf->loads[0] / (float)(1 << SI_LOAD_SHIFT);

That "magic value" needs at least to be explained on a comment
otherwise. With this fixed:

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
