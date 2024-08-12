Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88894EBE1
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2024 13:34:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BE013D2107
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2024 13:34:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9E2B43CD80A
 for <ltp@lists.linux.it>; Mon, 12 Aug 2024 13:34:13 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=lists.linux.it)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 091F51400257
 for <ltp@lists.linux.it>; Mon, 12 Aug 2024 13:34:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04077CE0D9A;
 Mon, 12 Aug 2024 11:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE775C32782;
 Mon, 12 Aug 2024 11:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723462448;
 bh=YzQWNzHUVtjC21KaSPNPbzz4LWAtZQNSwkGgV6/baAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RosAhIHUx1Pks6DTw1MepkHhqrlPL6GP8VQLHR8Jr0exiAr00Md92alPX588lSG/c
 vKLa9Q1kaqoodWvZSnM354Wdxkj/P0rwPko27sWgExaJJWwbSsNr56ewRGS+hSMCLb
 D5hSItTm82L/PLyTMnTdqQ4/x0dOIEABfQmnK8vJyXvUyFxy4w2qwEhCF4Th8i2A/t
 gIJab1CvS0RQ2z2Zi+1//ieU6SLXYeUsJ2Yu8bZo+EgT4XIFFVA+UNx07WVYJfQrga
 LtJtdpfn4CrHyTA7DXib9+q73GjItKmDyYDhn885qzT4bzDNn9O9hq7DNR8fHtZ9UK
 t/2elZRb6qaGA==
Date: Mon, 12 Aug 2024 07:34:06 -0400
From: Sasha Levin <sashal@kernel.org>
To: cel@kernel.org
Message-ID: <ZrnzLoZ8Tj9GhRSO@sashalap>
References: <20240810200009.9882-1-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240810200009.9882-1-cel@kernel.org>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 6.1.y 00/18] Backport "make svc_stat per-net
 instead of global"
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
Cc: linux-nfs@vger.kernel.org, sherry.yang@oracle.com, stable@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, calum.mackay@oracle.com,
 kernel-team@fb.com, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, Aug 10, 2024 at 03:59:51PM -0400, cel@kernel.org wrote:
>From: Chuck Lever <chuck.lever@oracle.com>
>
>Following up on
>
>https://lore.kernel.org/linux-nfs/d4b235df-4ee5-4824-9d48-e3b3c1f1f4d1@oracle.com/
>
>Here is a backport series targeting origin/linux-6.1.y that closes
>the information leak described in the above thread.
>
>I started with v6.1.y because that is the most recent LTS kernel
>and thus the closest to upstream. I plan to look at 5.15 and 5.10
>LTS too if this series is applied to v6.1.y.

6.6 would be the most recent LTS, and we would need to have this series
on top of 6.6 first before we can backport it to older trees :)

-- 
Thanks,
Sasha

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
