Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALMNJmZWjGm9lQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 11:13:58 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 318691233A6
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 11:13:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F3BD3CDDFB
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 11:13:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F19EC3CCB7F
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 11:13:55 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 74F1F600BBE
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 11:13:54 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-2a79998d35aso47332385ad.0
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 02:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770804833; x=1771409633; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CeUYLHcI/Cd40MGCSmqpuIqdzybioxDWF20b7XT1dQ=;
 b=h1EELW1nHKGiiVFzmYXXMcuN+5xj3Y0yG6Sr7DKIGSAJa5YQc/jkEx1FqWZovBH7of
 pmuSOQ+D3dlRP6iy+wsy9SwWyb1P/IfmuHNnSiMYM20BJXuczIpgGJFN8QwnLuhOYNF5
 Ze9milOIiZRDVCIzCPHdLD4LbfsKUIs11v8+wA4q5BgkZbLE+i/w/IDoSG9sWmMwpUbp
 RuSTVDLAuA2vJVkQG78ksfMZaqLgPYLVmSz0f5az7PjtWCnhxtvdQGNh5m+hLYa4nzT6
 5wWbDEQgFixeBzpFnrmE7YbfrZoBPg3J+Qo3+/ijYZFIDrUx4/6CVx/UQe6okKbuXJHx
 0mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770804833; x=1771409633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8CeUYLHcI/Cd40MGCSmqpuIqdzybioxDWF20b7XT1dQ=;
 b=SlJfFqmSWLKMsrMinTJ4wlGetmOPNWC6S9iUoOqJYjxgjtRbYWmo6o/d03VNWCT/Nf
 eGolNXp/WGN6+n6I1olyjnMAfcO1sMnr2LUd/EvHOpbXJOc107FjiSYDOXeQWjwiWXYZ
 uFD3xS8Iriu9zMUN+3ZOZUgtrS+p4Rmec88fJi76asyWbR0GpVr8Ull0MNi/4/M90IE3
 ff6B+0EOaWHHwVLqxtmKVkv8We4TgrSlLM+vp1KASTuQcZhJw7fU6DUlxtyLzmOX+65m
 GTH2Faj7lGvDjKNoqQQN/AGfItbnWCNcL6xYFtQW/IJP18Rno6owHkH4TZ3fNmXo6Tz/
 zT7w==
X-Gm-Message-State: AOJu0YyprkM2TQIIrrm21Vcp2Dx7GftsCba1GHmK8EVvxN/cI1DqRVvT
 OS1uIZAyzFTAyaFEfEusBfSVqruWAbwyNeKAWibiktlLyg8FGASBzZtiV9NdS7ZFLdrE
X-Gm-Gg: AZuq6aJEFDViV4b41yxIQ2iP1v00Hb7TF5AJOoAcfQGMnjoAM2hVaXpDjnxA5zxAmC1
 sTPeYMkSXFNiclVa/EJHyseLO1aDeZ6Tw1qYVzHi3xBiMMLMn16yq2INfqpx1m941wXmStSeDpT
 QNMCUD4XsYwWIJbkTnjVEI3dZoSbqMn1FqTh+z3NxglnWXxcP7E+83cSJlKghxiH5SUrQ+VnVYn
 DbR1T0kbBYLMUN8tgztJDk4lfPTOdOmQNCNncaDxBWoZqns7LeShpLBFMtQPUnRAeurl6WIBIzc
 eB2FZZfuNzPKB2+72y4DhqH3MJf8zks5RhsR/CW4E7Gp+nejVMsJG8ZugFlUkxaceFwD9nKStrQ
 MsovJTE8iwV91KBOwElFRgRoUJ7FFffSwt8uGj5AKrhOyOK57AOYLb3oBNicJ0MpGHFIEq69aDT
 WAFDzLzR9Qf2+RGycQ9oRyqMf77VKhwsXxcIRnJqFF/Q==
X-Received: by 2002:a17:903:41cd:b0:2a9:63f4:117 with SMTP id
 d9443c01a7336-2ab29f8ea62mr18683125ad.41.1770804832528; 
 Wed, 11 Feb 2026 02:13:52 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2986dc11sm17609805ad.23.2026.02.11.02.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 02:13:52 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 11 Feb 2026 19:12:50 +0900
Message-ID: <20260211101328.1180-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGC0LPS5JBO5.DEZE7CY4YTHU@suse.com>
References: <DGC0LPS5JBO5.DEZE7CY4YTHU@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] inotify: modernize with SAFE_ wrappers and fix minor
 style issues
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
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 318691233A6
X-Rspamd-Action: no action

Hi Andrea,

Thanks for the review!

I set len_strict=0 intentionally.

With len_strict=1, SAFE_READ would trigger TBROK on partial reads (e.g.
240 bytes when EVENT_BUF_LEN=32768), which are normal and expected for
an inotify fd.

len_strict=0 still catches real read errors (ret=-1), while allowing
partial reads so the test can continue processing the events.

Thanks,
Jinseok.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
