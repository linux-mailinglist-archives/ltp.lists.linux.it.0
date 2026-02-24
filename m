Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNYLL7XZnWk0SQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 18:02:45 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C118A401
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 18:02:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AD193E8B94
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 18:02:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D58D33CB958
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 18:02:40 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1FDCE200B2C
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 18:02:40 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-2a95bfdb31eso24384895ad.3
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771952558; x=1772557358; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJBvyghComosO9Up0b9d0GfQvYqS2Kfk9Z+A/XJ7HY4=;
 b=Gc6ZMJK1omkNrrmVNOgFUeyaKHSf9Kz03mQSQq6dMKWaNFga7DdKYNTegAXL6zPoJq
 I1orksoNyPho9O5KqFUZBD9gddsIM6w8vAofZlVKD+uPhZtkJSRNceYoBva72ZuybNuv
 1YWEPUyjUM81SQT1FAZGn5MCSq0u9TSvSnEaorHur/6fwNbzW7/tHNUMoHrTaP0eBSIb
 C1Js2GlFHtxqzbncPcKqVI8DpImQFwBwG77Dk94MAhdZ89e+5VAneN7KQ3SqzVYlItXe
 Ow46GwZHUU0XtwJGy2XPx3I805jJKCiqD1Flpq6P4kUw9Ip0tjGL+F0gTV/KUXmIw2s4
 5iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771952558; x=1772557358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IJBvyghComosO9Up0b9d0GfQvYqS2Kfk9Z+A/XJ7HY4=;
 b=auGbxSBenfFQXYmPQWdR/+JLQKrQqjnzY/0caHFwXoNO6fiYJ1ME8raFlZssgMdUtp
 gwESBLax9IyGMmEUyTTIabs1LTIvs4sa92Xv1Jbh7Ia1Y0mQpI0B3pXw4miDtvAt80jj
 gAdV3c25L9TYiubWgO84k6nseBSujD4x9ZLCVIKBonuOxf9YeSDZ3UUPR6W2WcTB101m
 e5TZ8HZ5M5eSa1rXRwiydS1hBQclYy4rsLztSE4lV9pe491R+WtkEqlYDVuPmbZ8Cv4R
 SB1S7/xUBjJ9xgAoCl78zxxy1xIFvu2CJSklzUH4LDzGzYr2rj3qg0CQyBAvGfnNzf+M
 G5BQ==
X-Gm-Message-State: AOJu0YwN7sBGzJR+F5f5CnjCAw6xPtxgzqyqiN+BhXDOv36MRv4OuMgM
 oucNwi9qISomO8bTff/oo0DwYmA33gZ/07s59TEHUu8ZXEw5PJUtFMwnE3QsBudIaw==
X-Gm-Gg: ATEYQzytAoko/t4gtrR+K1zGM8lavaDps+GKz/NjriCAcGkqgQh5ebrzTcP7m3kwpe/
 NcFovnV+JzD9N6xUpfEXe4Y30h/KCIjM/8SH9dd2caoW9rttuCv7T17VMQuyj8DTHzDnMkG2Rl+
 +SL+L8FAsZPJumPAC6a7OxsBcj6r2MiXsT2LzlVM1bdoQGLbK2FHiiLly235KlZAeItWB0wt+cl
 wG/PbDoduLP8eSWGityxNX+bte/r2YEghYDuAOcjIdnIiFExgWYSCIcJtTM12oUmq/rG1TFfwaD
 ByO+gIlorJ5ZLzJUiSjQptP3XC+8BIGJFpdbAQY4NQpjBhLFhlT4dnDnAJbgQj+fXAQVSV+99LH
 lgcxST28clypgryuzrOcT3wBE6PUrX2NhqY0vvnAbVmSIQ2rhUQwO8yoYXCKk4BNXSxy3Br0K7b
 1AZIYDW8WvvibkzazxL5bPb/Zj/6rEYdNx7vYPsN5HJw==
X-Received: by 2002:a17:902:ecc6:b0:2aa:d7a7:8084 with SMTP id
 d9443c01a7336-2ad74419486mr126692905ad.6.1771952558095; 
 Tue, 24 Feb 2026 09:02:38 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad75044c72sm113744095ad.86.2026.02.24.09.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 09:02:37 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: chrubis@suse.cz
Date: Wed, 25 Feb 2026 02:02:04 +0900
Message-ID: <20260224170212.46294-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZ3EWrWQCy7LeSTa@yuki.lan>
References: <aZ3EWrWQCy7LeSTa@yuki.lan>
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.5.0.0.0.0.1.0.0.8.1.4.1.1.0.0.2.asn6.rspamd.com:server fail];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-ltp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 556C118A401
X-Rspamd-Action: no action

Hi,

Thanks for the review.

You're right, I missed that. Sorry for the extra work.

Jinseok.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
