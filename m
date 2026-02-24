Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKlmM9egnWlrQwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 14:00:07 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C16E18758C
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 14:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771938007; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=6/OSAGRZWAvjNl3kFJgF6A24QYkaPi+CCbjotJgikcw=;
 b=SqR+3Z1MvuyiVlZN4pilwpPRb4adzz+14LsIQbb9+fgQ9sh0EfxIO/9Zcf+2w3QQxuuIu
 qh3D4HuzbhKCCXb44E3saazc75mh2qznzDKCybTM7qo/EtX0iDk0rda43vEUeVdi3VLeds2
 IZavJR+PLFuVw9Vqob0JgwbcnpmhTXg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D3C73D0F96
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 14:00:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A30B83D0F7C
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 14:00:02 +0100 (CET)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8902D2009B7
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 14:00:02 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4837634de51so24468225e9.1
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 05:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771938002; x=1772542802; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05bvXVPxl8Y9/L+8LkYUodN7Ar04rgjurLTmdvGhock=;
 b=eOREO4RqPCoLNG6rRpy4F/dhFnFOAUdmHJN7pGvAKBLqgqbCnXiQuAIQS+RNKL2C+i
 Iql9niZycFpdmBc+AWMxKGChknjzkNq8T9KRJwMY7QMszWBo/862IHPubLSjd3D23pN4
 VcM+I5smZl40qVeblTn1E2Y7rqNCEM8M13EfdeOSxinC3AuPxjuBrIzy0wZDUTz0+UIf
 Vzvd17Ycskbn8XgYsnCcYlm5BFD82KdVoC7sUwEQqgaZIJgcGvDDaBdC48eRcTjXbNP9
 XKAIAP4RUmzTZFsX4xKE1Pk8561p/PKUlZKhMu73txmKqVXWu9TSdQ1OZqDJgsHOo3es
 cjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771938002; x=1772542802;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=05bvXVPxl8Y9/L+8LkYUodN7Ar04rgjurLTmdvGhock=;
 b=rantEKEQc3hsdGGKPFD3SLGqiHiIkekH88Zw1vlVAscCM8nR0czT0gXxIobilRRkhz
 q+02/2NeHu7KoftUkPf03S/X/LfEoFgfRpYDkml+QhS71ytPP697hPbsWpUM0n+I7rF+
 7M9sUZT1c5/Yp/xCjQ/8a3T7N9Ev09tPobW92o3wV3av9AVTMWnYKQSg4ae23z1Xxmfs
 G/dy3duZdsKEPqXKvsD+k4IPRlT2AOLbedqiJtkawkjgEi1eyzFBHVAGDELADzvmhI3s
 9SZ08KJimzbMoIHOrvJxA4n5071i0qmTYBvyK/SQU5+crLZQslzecMutwj3ZsIbqGGQA
 nTVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrhDZX3AXNmCa025sFWFpk6NaUbBqaz7i9dQlB0T30BFAao93SpnSKGWVCJ2BvFQKQGcE=@lists.linux.it
X-Gm-Message-State: AOJu0YySO0UCUCRExOcIlwA4g75N4y8PDAomACVvxCUnhgmvGRdt/iCo
 W4KQj7hdUVgKzuZkJXKVrq6L2fLw9LlAk97HoT09TgMiw4AnwTsWFMCslqE3OvrrNUE=
X-Gm-Gg: AZuq6aJdzsmgE26F1PeFMFAXkmy4BurRWftf0pTiHLjrwUtKv0qS2VEHEcp/agvxtFv
 vT2k/8ULddzb1MymhaQrDyeFyBuGKO4twWuIdXCGhYmXEX091D+qOGtrUuZj112/xiL3fpPr6N3
 wbodIUfxXqGO5ngRhQIF1hPaF6Mb9Ngp+Dyen37AmUNgKrWkGd+K0m9X7nwhh9Rjlvcwl+nVHQD
 UueWN6moYUkT+Qmrznmf9KkYeKoHXeXhCBLhatQzWIBTaVv7H0T73jxxUocWYFejjrG1/fZeWKd
 Og+6vQzpo2OIg7VSm2nkkshcl8GT7ZSpIPavT3UYyXrv81n9yEIpmjJ6YPVjCv3rsn6lFq7dmNj
 SmHc9s0xfbqALaxdXS3e/p9/TXvyuuPm0hUGgKhZ+7c6i/soc/STigdHwlobp1csKL0jK+48SkZ
 Xi8KfWoxItEjtP+XnsmVdmQGq2
X-Received: by 2002:a05:600c:5020:b0:483:a2db:6743 with SMTP id
 5b1f17b1804b1-483a95eb82amr211869465e9.4.1771938001912; 
 Tue, 24 Feb 2026 05:00:01 -0800 (PST)
Received: from localhost ([88.128.90.16]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b88e4294sm35775635e9.1.2026.02.24.05.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 05:00:01 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 14:00:01 +0100
Message-Id: <DGN7LK3GOWZZ.1XN59T11R3F20@suse.com>
To: "Guixiong Wei" <weiguixiong@bytedance.com>, <ltp@lists.linux.it>
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
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:replyto,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 7C16E18758C
X-Rspamd-Action: no action

Merged, thanks!

To 
   ..  master -> master

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
