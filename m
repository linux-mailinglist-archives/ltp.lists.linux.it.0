Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 799BACB5116
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Dec 2025 09:12:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D2403CF13E
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Dec 2025 09:12:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C0A263C00B3
 for <ltp@lists.linux.it>; Thu, 11 Dec 2025 09:12:25 +0100 (CET)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D3138140074D
 for <ltp@lists.linux.it>; Thu, 11 Dec 2025 09:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nl
 W8h3+CBYovlUpXj9JIk9u4tOEbYyaKqQLRDWMeANw=; b=VhEU3bIJnZc9RsI2h/
 GAZGTs8i5vgj7UiNiB5V9MxwqooZ0Qlmx+PNbjtx4CyypWWZQnq/FZ/h41PhZizH
 PZv/Uv1ra1nhVhZQyZ3gWmUXkHOvYn0+J5lNA/0Fz4bzrVRfWuMdi6Gec0rQpoSc
 wALnPqCpoLVePLgZQd3xjHULk=
Received: from localhost (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wBXX3fjfDppj1RXBA--.58468S2; 
 Thu, 11 Dec 2025 16:12:20 +0800 (CST)
From: simplemessager@163.com
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Thu, 11 Dec 2025 16:11:29 +0800
Message-ID: <20251211081205.342673-1-simplemessager@163.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251209195328.GB24146@pevik>
References: <20251209195328.GB24146@pevik>
MIME-Version: 1.0
X-CM-TRANSID: _____wBXX3fjfDppj1RXBA--.58468S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7v38UUUUU
X-Originating-IP: [36.111.64.84]
X-CM-SenderInfo: hvlp1z5hph22hdjh2qqrwthudrp/xtbC8ARB2Gk6fOSuGAAA3Q
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] safe_keyctl: Skip with TCONF on EOPNOTSUPP
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

Thanks for your review.

Mingyu Li


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
