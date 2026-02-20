Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCy3Ne9qmGn4IAMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 15:08:47 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F41682BD
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 15:08:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC9473C0EB3
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 15:08:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 001023C0EB3
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 15:08:35 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 71399200149
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 15:08:35 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-2aaed195901so10333575ad.0
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771596514; x=1772201314; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BIWnf+/GAyezZ8X4kIcBw3NTfSg77ZNqpBuc0he4i+k=;
 b=AgirkfchdK/VFeQYM/qkBf7X28wgcBJy79So2mNzo84//RmnyqgUX5WLPi6C1BVKxa
 3BP/RihjIk56JnMfpll3tbStk6DBPLJJ/Tk0KdRF9fqMuvzwvSR63/JkNftBQT1kx4Au
 +KVzTj1dGdfiJnmuHHzAA6/1sEpWQ2b9+ENva345ge9PrYD4GcU9MkwjTIBS+70j1YUN
 JmFC2CYq6BTATNfUr12rEF/keb+cIJ5SueGNeGZvSgJlRxNTpTkZzKyHiIlubvms6YtV
 emyvX+mjiYoxYXFVtkiwbihi3eFneiXgW81UJ8xkvfD7IsDDqeDqmTY0Kg4oP0j9yZtr
 HPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771596514; x=1772201314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BIWnf+/GAyezZ8X4kIcBw3NTfSg77ZNqpBuc0he4i+k=;
 b=FOOW7Y8pda2xN+jmFvZ5ERBt5PpemFnXd/YD8V+w0qkRtkYNxhErFo4szY9HJy4Yoj
 FaQdIqOG3NZ9eem5YTE9QBxmPnTMTTdyZpD8H4qGjm0YqW9/CdPS9PRQoEpTf//0Wlud
 9al/8J1Pltczr6HZhQQ3wV2rnOdhr9X39x4ovSRktn5BShD2NlgdN7Bs/PqbcHtG9KqK
 KgbSf395fcamxEhHjALVtjOcagyWYPRWAZ1NNgGnKjUqfIRloLCkIpDMT3eCQ27gMFJd
 2MtXW8Od5ivgckhy1jLMKzT/U0xDukFnAGK/M1Y0mlBZAUf3hV5NGQk8fNZELNenj+Av
 WIZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg9w4BmSgqDfuy0Fn4zLjw03T5Ph1gp+EhyJxYhNWDFh0eVffBV/KNzWhJs1F0HmsDi/Q=@lists.linux.it
X-Gm-Message-State: AOJu0YyRZyvHyNUS/hOzFbx+SSuEZtQYQQQgdP152K0ouRJAeJrb9x+r
 d1rXUlRDB4jNHCH/IDsYjMnP0EJx0kPGY2EW+2p0VBYHSxXptjShq3s=
X-Gm-Gg: AZuq6aLcxkCm8E3IdiQHC8iOEvh8IzIIi5uIhBoSemQgqgt5LHAc0rGt/4BjeKd2WsE
 sejbnVChql/w5ylhpNFZomb/nBKS01/Bm/BZa2TwAb8YmxMn3i+2mzTZ7YTDAEq4GXI4H+FhUKl
 AvDCybcOeN5Yj2keVqiA2MDsR+qELVgiWvnxHAUHakD5sURc5YqVz1vHrNSdq5a6aEWAB9XT220
 PgPrvLgGFWUF4n2qNxCq5YNKWEZEwpEuVvbKr2bESw/kb3vJki24B/9Yn14xn5c9RZ0mfCC+ENt
 9oGYUtMTi4FR1Sp8g462TM3UZeKgzS+qtbtocGmA3UwgT84vDFybUFy2KDJfK6+Oin0nSlLnsai
 CmT1cGtjQZCzOdNvXiEuhX0wckR6ufNzDx8e57d6hyL4NyOKHcJdXXKNTIdSAAUXhP0e2s7u1Go
 Nahb0Cd3OlcNFFaGs3FnyswpHadLXExMLFNoC4eVvxnQ==
X-Received: by 2002:a17:902:f682:b0:2aa:e6fa:2f74 with SMTP id
 d9443c01a7336-2ad73462626mr1188945ad.2.1771596513759; 
 Fri, 20 Feb 2026 06:08:33 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1aae9bb0sm184670645ad.80.2026.02.20.06.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 06:08:33 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Fri, 20 Feb 2026 23:08:07 +0900
Message-ID: <20260220140809.3981-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZg64qwkB4tG18ZE@yuki.lan>
References: <aZg64qwkB4tG18ZE@yuki.lan>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] inotify: cleanup - limit masks, use SAFE_ wrappers
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
	R_SPF_ALLOW(-0.20)[+a:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 719F41682BD
X-Rspamd-Action: no action

Hi!

Thanks for the review.

So does this mean IN_ALL_EVENTS is used (and should stay) in all test
files, not just inotify01.c?

If so, do the test files that are currently not using IN_ALL_EVENTS
need to be updated to use it, or can they stay as-is?

Thanks.
Jinseok.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
