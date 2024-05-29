Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D738D2D2C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2024 08:25:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EEC13D0644
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2024 08:25:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D0DFC3D05E3
 for <ltp@lists.linux.it>; Wed, 29 May 2024 08:25:32 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c55c297d46ee5715703b+7584+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=lists.linux.it)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 782051400FB0
 for <ltp@lists.linux.it>; Wed, 29 May 2024 08:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=QtSENrOuMtS0Fcc9xBXd1F7dj1
 2F0NEAXp3g+3BGTbnTYgJQYdts/ZS5hdBK7kqf5BLZYS0Khut0Y4bCpguUfSZE/GFNB8dPvl9dfdG
 S0IJ/+nwwV6va3QJlxXJSB8eM9lBW9up1GR85i0VEXtH+ZQyax5zgbvukD0nOdsr6bZhGbEWiJPYH
 kBFASZDLuI4GGfa61368eD4upFhtJk80VsRJQCWO8+IA6xuGD7PWLUCL6971Y5i8v1iiMMLyOoFE+
 El4OJX3wJanKu/sIZbClgLLXz53JbqZ2gJO0m0zNw0nbfwPJbSdmx7/diK7E4HtsRVsNg0PYNKzD6
 I0m/LMbw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sCCkZ-000000030DP-11xY;
 Wed, 29 May 2024 06:25:27 +0000
Date: Tue, 28 May 2024 23:25:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: NeilBrown <neilb@suse.de>
Message-ID: <ZlbKVyVIJjh-_pUD@infradead.org>
References: <171693789645.27191.13475059024941012614@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <171693789645.27191.13475059024941012614@noble.neil.brown.name>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] NFS: abort nfs_atomic_open_v23 if name is too
 long.
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
Cc: Aishwarya.TCV@arm.com, linux-nfs@vger.kernel.org, broonie@kernel.org,
 Anna Schumaker <anna@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
