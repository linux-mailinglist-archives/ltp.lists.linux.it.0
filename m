Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D70DE96003C
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2024 06:17:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1724732254; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=02Lvd7Ozqk2mw9dRq19juqEml+8VDengwsO4qLIUSHI=;
 b=WdiRYUl2bsEdSOT/zws/i+V+2SK5nZA9zwB1yY2Vz4GnpdPtO+xBFdpnHRB7puzhW9x+Z
 NOsC21Rs3HT12OqzB6pFcIZYV2uzezDUke2ewa+APe6VajKM6MJvm59DgH2ohheTHl66nbQ
 shBNGjJVF/OFT6QVmjy3BlSjwXC2Vtg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95F513D25DC
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2024 06:17:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 69DC23D1D71
 for <ltp@lists.linux.it>; Tue, 27 Aug 2024 06:17:32 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3;
 helo=nyc.source.kernel.org; envelope-from=dlemoal@kernel.org;
 receiver=lists.linux.it)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C5B6B1A00808
 for <ltp@lists.linux.it>; Tue, 27 Aug 2024 06:17:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 628E9A414FE;
 Tue, 27 Aug 2024 04:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4514C8B7DB;
 Tue, 27 Aug 2024 04:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724731808;
 bh=WBGmxdTNYrDMD/MZtZv/WG7UnRj4G6OgQJKos5ikc6g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d9qvI9oH2+mEalnSJwCGQNHtNdfCNtQT/lo+z4XtZ82FlYDbYNedLN2oJCxkqfAp7
 Phg0BRpfyMp3xXZOYGvkilUlpnpuKa/6Q5OiEBr1fr/ECkixxDkzqEAK1nkJj/Yhbi
 cKt8zUmwcWrZgAAH3G7HGtDXlo59qj6aHV3y3TL3FAEXFXsD7IrkXE/06BW4Cl34SP
 jkM87ZHboReMMnpYdEaCOzmZ0o7FG1d2gFjzAjgwTDSMEhIfCS5rsR4mJZld3huTCD
 HEJwwE/vQTFTVFvCiQXp5Qa/MbI0cxluD6Mpn2yN9h5tXCx1VQ4ivvlgjcIQsWVn+I
 hS+sBGORwxsIg==
Message-ID: <a7585769-5e2d-4ecd-8dd4-2f8f04243c05@kernel.org>
Date: Tue, 27 Aug 2024 13:10:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Wang <liwang@redhat.com>, linux-kernel@vger.kernel.org,
 ltp@lists.linux.it
References: <20240827032218.34744-1-liwang@redhat.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240827032218.34744-1-liwang@redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] loop: Increase bsize variable from unsigned short
 to unsigned int
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
From: Damien Le Moal via ltp <ltp@lists.linux.it>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, John Garry <john.g.garry@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/27/24 12:22, Li Wang wrote:
> This change allows the loopback driver to handle larger block sizes
> and increases the consistency of data types used within the driver.
> Especially to mactch the struct queue_limits.logical_block_size type.
> 
> Also, this is to get rid of the LTP/ioctl_loop06 test failure:
> 
>   12 ioctl_loop06.c:76: TINFO: Using LOOP_SET_BLOCK_SIZE with arg > PAGE_SIZE
>   13 ioctl_loop06.c:59: TFAIL: Set block size succeed unexpectedly
>   ...
>   18 ioctl_loop06.c:76: TINFO: Using LOOP_CONFIGURE with block_size > PAGE_SIZE
>   19 ioctl_loop06.c:59: TFAIL: Set block size succeed unexpectedly
> 
> Link: https://lists.linux.it/pipermail/ltp/2024-August/039912.html
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Jan Stancek <jstancek@redhat.com>
> Cc: John Garry <john.g.garry@oracle.com>
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
