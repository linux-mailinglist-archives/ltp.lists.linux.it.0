Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7C1A698E9
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Mar 2025 20:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1742411809; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=6anNlMLmjGH8bj+rlE/4msHpZ/JpYFWsjUEJmVyGizk=;
 b=lrVeHaA4gYPx5uVcexds9YJP8hRe0SFujxp4Z4JtGVbASrPTfQlWo4zSo/1331syZHYSp
 gcPFinIdmfLYMZ7oxVml1jv+TOTYWB6MQXbB2uchKU78KyQl6+QszRzmdLNXMtv1HJLUPd8
 Q6bVzj45yDDzDViwlvGP2V+//8L+jTE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B64C3CADE2
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Mar 2025 20:16:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A62DA3CADD5
 for <ltp@lists.linux.it>; Wed, 19 Mar 2025 20:16:46 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=mcgrof@kernel.org; receiver=lists.linux.it)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0AE28600C51
 for <ltp@lists.linux.it>; Wed, 19 Mar 2025 20:16:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8CB655C6072;
 Wed, 19 Mar 2025 19:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC98BC4CEE4;
 Wed, 19 Mar 2025 19:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742411803;
 bh=qjx1B59hoS6fWrjlxV8KqXGYvk4wKJyBCj4Y5hG4/gY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nf0MV1S+x03uJtoprF9Fu0OaQNr/sJO0Rg5YAsotBru3nXsJF4F3E97Lp2oJbgjb9
 jla4voX6Eq03V7rGcCpnvD9/0HTbaYePcLmYqF/iqF8mHXtVdfmQrzpMFyh7xsE+IJ
 HiECSRS8lBou0qWgPpfAc7lY9b430yWTzqA1a2MI6KgP9v/IlxXav6cnTp3enchzMx
 Kx4PAUYV53+vkrerfG+TVPWTnqF9Vc2hCktYsleh0rlotzUFBBctIjC6Z7w5fkSmLa
 Jf5Srmo1CSlnmZfSBa/rzHybpVDwwegNY8KA5+4TFSJfeMbZevQUVJwgDiOZCrBWrc
 hvU5+P+HcSreA==
Date: Wed, 19 Mar 2025 12:16:41 -0700
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z9sYGccL4TocoITf@bombadil.infradead.org>
References: <202503101536.27099c77-lkp@intel.com>
 <20250311-testphasen-behelfen-09b950bbecbf@brauner>
 <Z9kEdPLNT8SOyOQT@xsang-OptiPlex-9020>
 <Z9krpfrKjnFs6mfE@bombadil.infradead.org>
 <Z9mFKa3p5P9TBSTQ@casper.infradead.org>
 <Z9n_Iu6W40ZNnKwT@bombadil.infradead.org>
 <Z9oy3i3n_HKFu1M1@casper.infradead.org>
 <Z9r27eUk993BNWTX@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9r27eUk993BNWTX@bombadil.infradead.org>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [linux-next:master] [block/bdev] 3c20917120:
 BUG:sleeping_function_called_from_invalid_context_at_mm/util.c
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
From: Luis Chamberlain via ltp <ltp@lists.linux.it>
Reply-To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Pankaj Raghav <p.raghav@samsung.com>, Daniel Gomez <da.gomez@samsung.com>,
 Christian Brauner <brauner@kernel.org>, David Bueso <dave@stgolabs.net>,
 Jan Kara <jack@suse.cz>, lkp@intel.com, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, Oliver Sang <oliver.sang@intel.com>,
 Hannes Reinecke <hare@suse.de>, John Garry <john.g.garry@oracle.com>,
 oe-lkp@lists.linux.dev, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Mar 19, 2025 at 09:55:11AM -0700, Luis Chamberlain wrote:
> FWIW, I'm not seeing this crash or any kernel splat within the
> same time (I'll let this run the full 2.5 hours now to verify) on
> vanilla 6.14.0-rc3 + the 64k-sector-size patches, which would explain why I
> hadn't seen this in my earlier testing over 10 ext4 profiles on fstests. This
> particular crash seems likely to be an artifact on the development cycle on
> next-20250317.

I confirm that with a vanilla 6.14.0-rc3 + the 64k-sector-size patches a 2.5
hour run generic/750 doesn't crash at all. So indeed something on the
development cycle leads to this particular crash.

  Luis

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
