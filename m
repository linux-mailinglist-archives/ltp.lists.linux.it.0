Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304ACAFEE8
	for <lists+linux-ltp@lfdr.de>; Tue, 09 Dec 2025 13:30:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67C7E3D02E4
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Dec 2025 13:30:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F33843D0228
 for <ltp@lists.linux.it>; Tue,  9 Dec 2025 13:29:57 +0100 (CET)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B464060007B
 for <ltp@lists.linux.it>; Tue,  9 Dec 2025 13:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zu
 jvcFWNVcF/EfYtZ/fKqy1RHAAcJFh2796WXJEExUs=; b=U7lczZ7ex2QgpQ57pg
 r+w5hZSFldoXkzFcAUQ3U9boQyiYlhmNroK5ScN+sQ340mzBIftrcZZr7GlmE4Mr
 XC0f1BDZO1yICTY6RB9RupvvYmzngztaB0/sp8lP6UieUN8LTdq+UQnT1PciDmJg
 e/2ZL8gGgWmq5hVzgCKk2OgnE=
Received: from localhost (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgBnlsU+FjhpZPVDGw--.135S2;
 Tue, 09 Dec 2025 20:29:52 +0800 (CST)
From: simplemessager@163.com
To: badmailer@163.com,
	ltp@lists.linux.it
Date: Tue,  9 Dec 2025 20:29:17 +0800
Message-ID: <20251209122937.212641-1-simplemessager@163.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251208150542.704006-1-pvorel@suse.cz>
References: <20251208150542.704006-1-pvorel@suse.cz>
MIME-Version: 1.0
X-CM-TRANSID: PygvCgBnlsU+FjhpZPVDGw--.135S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7IJmUUUUU
X-Originating-IP: [36.111.64.84]
X-CM-SenderInfo: hvlp1z5hph22hdjh2qqrwthudrp/xtbC7wD9lWk4FkDxBgAA33
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/2] safe_keyctl: Skip with TCONF on EOPNOTSUPP
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

Mingyu Li
>
>Kind regards,
>Petr
>
>Petr Vorel (2):
>  safe_keyctl: Skip with TCONF on EOPNOTSUPP
>  wqueue0*: Use SAFE_KEYCTL()
>
> include/lapi/keyctl.h                | 3 ++-
> testcases/kernel/watchqueue/common.h | 4 ++--
> 2 files changed, 4 insertions(+), 3 deletions(-)
>
>--
>2.51.0
>
>
>--
>Mailing list info: https://lists.linux.it/listinfo/ltp


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
