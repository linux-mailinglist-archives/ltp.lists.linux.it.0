Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDABF7268
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:45:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E7F13C234F
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:45:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 64AEA3C176C
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:36:33 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8AFBD2011FF
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:36:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=Swru49g7s+A94QhHKZRBNdA6C
 k60AaFFEPs7AMy17/rEKs+sBONGiV2W42BotF5KCRcdxI+hx/S/PgvVwvbZcjiPZtqFATl74qkZWp
 k6dyUb94on2lnXQ4SY8ws/qbU5lATtgfKAzjXrHL3eTIzLCoJvI2OTxmL/sS+zX7MzL2EeIl1hrF0
 J6gtImUnhDKxgeBu1UlbCjo14cVJdcRPJJSW2zD2niWBiErzo/IK3+yVL25rCY15sC8Yjpbjf1FKw
 GGz2eSTK0O3fIZFrzceSD5Kah6lGgZLSZXZ32PkAJIPYRqR7/rmXmpu5oXfnYEkPVbHUkI965S7PZ
 MNG+g2EJw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iU73T-0007BK-Hy; Mon, 11 Nov 2019 10:36:19 +0000
Date: Mon, 11 Nov 2019 02:36:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191111103619.GA25583@infradead.org>
References: <20191111083815.GA29540@infradead.org>
 <b757ff64ddf68519fc3d55b66fcd8a1d4b436395.1573467154.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b757ff64ddf68519fc3d55b66fcd8a1d4b436395.1573467154.git.jstancek@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 11 Nov 2019 11:45:19 +0100
Subject: Re: [LTP] [PATCH] iomap: fix return value of iomap_dio_bio_actor on
 32bit systems
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
Cc: tytso@mit.edu, arnd@arndb.de, darrick.wong@oracle.com,
 linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, hch@infradead.org,
 linux-next@vger.kernel.org, broonie@kernel.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
