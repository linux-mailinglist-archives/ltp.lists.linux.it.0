Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vWBRJ1q0mWkgWQMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Sat, 21 Feb 2026 14:34:18 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B7C16CEAD
	for <lists+linux-ltp@lfdr.de>; Sat, 21 Feb 2026 14:34:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAE913D0476
	for <lists+linux-ltp@lfdr.de>; Sat, 21 Feb 2026 14:34:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1613C3C196B
 for <ltp@lists.linux.it>; Sat, 21 Feb 2026 14:34:13 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9AFBC20021C
 for <ltp@lists.linux.it>; Sat, 21 Feb 2026 14:34:13 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-2a79ded11a2so19630755ad.3
 for <ltp@lists.linux.it>; Sat, 21 Feb 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771680852; x=1772285652; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=81/ND89N/LbpM5zvFcNLXKtmJijbR/eYJVFrf4NjFe4=;
 b=FLYZVvxPU8nHH2gv1N6XNLqwUWT7FQUnZy5LBBpyzXNJMoDNYPTh+yDiDzocFcuGTg
 RbZMLzqzlVj3OryufWMYh4vgqXxzyj6yeUz0m1iOph3jCig2ER9+ILCVw61L4sjBuU7w
 +m3Uh9s/09CwrxKDykDHa+nsoRJQmSgJKGreaJxumrJQFxD8GgT1HeqfouLiISywdAIb
 +j4ShlJ7C8/8Cv3E454XwMFbMnGZSy7wOhdmtDChwjdyWAD40OoABPFkKf2nZ8QSCWiA
 D/dJ4Vcjr8u/YTenyDZa+ek924o+mresH+ejGY+Y8uG+dEpqGowcKbbV6S279hFRgdvr
 SjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771680852; x=1772285652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=81/ND89N/LbpM5zvFcNLXKtmJijbR/eYJVFrf4NjFe4=;
 b=rvaYEMz+lZfB8dJ6+BwvT3EkgI4IMpI/tZnwiEbNduVjJrW+TnWDOf+FivKgPwP4qM
 oi0w0Ix1uYQ4Q0zNAgUlBR9CnQDNXKTfW+fkmqL1fncsDTVoiPuR/8fKXxtkMGiSwXui
 EkfF3q8rnoqoIwPjJQNsioGlPiIy4p2h+muRDnjOf3K7WAu4mOEh66nBMkldExACdlk6
 izcANzR/7qsbnrVvP3J2HWtZPKcMzEwqD3q9XsLb/N9FReWXDecx1nWvJtFWWMQ3Ie80
 wfuyEQ6cpNzGK+IF/cH6Y9riE7xEy5Er28OdAYMC6KHeMdw1XLI75x6VTH5UCBfTbaFL
 CIPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA3FAeEal3oZyyT4RwcVm87MfiAgUhCo9AehdMPNYKOz3KO4Ef/l3xlLPMdomJft4L6y4=@lists.linux.it
X-Gm-Message-State: AOJu0Yy14qjlEpddgHnN1F1y0F8iR22evptFxqZT4DjlFTY5X9ScLYxl
 ZW7d+AA8rS7/qv2+ApllsSVsgMIy7lhASPQx5zornqqpNYu7wjAlWARIyIAvlsk=
X-Gm-Gg: AZuq6aLafKWt0pgWjgAEtddv0ZErFy3sos6HuieBONXcQ4RFI37w1HG2flz7jjA220+
 vu6hNGSkqI7BKbhziTIDGacDugK6InD6QL7QoZwYUyH98VxRX2PA3H4CZyxjgctE95hPihV3JWn
 tEL8/qjiJxXjzxygI2FbvkDAS2MmH8q7C0ybChd4tshwEZxTgJOCspFh+vrCE386OK3Vht7x2rI
 umWtyL+1GTTkTpG6ljv96p+ad/Q308n4swRpZBfKfF49B7GaOVUdvTN9OyHRk/s+BUefpNjJ+XJ
 vjdQz9muqU926s13B8QQ+ILSZF3KEAIbgzcpn5enc+b6OtQg7FbNXuV0hcXLQ7wvYjN72GEkS77
 4dGIqUhU77AW6iyYmkDXWn8nKebDayBhDShkRXGm5WPkyHlGIMKX1iFZRIe1+LbT8HhL5CZWWHD
 GBMgqmzguopngV6oXAG0u1VX5H4Om3Wn9u2BVDqB8NRg==
X-Received: by 2002:a17:903:32cb:b0:296:2b7a:90cd with SMTP id
 d9443c01a7336-2ad744edc14mr31648325ad.32.1771680851862; 
 Sat, 21 Feb 2026 05:34:11 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74f770b9sm22021225ad.41.2026.02.21.05.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Feb 2026 05:34:11 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sat, 21 Feb 2026 22:33:46 +0900
Message-ID: <20260221133347.37595-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZgx0rp0MRHn4mMT@yuki.lan>
References: <aZgx0rp0MRHn4mMT@yuki.lan>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/2] poll: add basic POLLHUP semantics test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 25B7C16CEAD
X-Rspamd-Action: no action

Hi,

Thanks for the review.

I've added the return value check as suggested. Since TST_RET is a long,
I used %ld in the message to match the type and avoid format warnings.

The suggestion about closing the fd while poll() is sleeping in the
kernel makes sense as well. I'll keep this in mind and consider adding
such a scenario as a follow-up test using the thread helpers you
mentioned.

Best regards,
Jinseok.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
