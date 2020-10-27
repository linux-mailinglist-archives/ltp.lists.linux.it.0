Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 840BD29C7BD
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 19:49:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F1043C5601
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 19:49:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 245A73C30F8
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 19:49:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AB5221000C09
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 19:49:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA698ACAA;
 Tue, 27 Oct 2020 18:49:27 +0000 (UTC)
Date: Tue, 27 Oct 2020 19:49:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: linux-block@vger.kernel.org
Message-ID: <20201027184926.GA24024@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] Ocassional dropping of uevent of loop device (possible race)
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>, Martijn Coenen <maco@android.com>,
 Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi

commit 716ad0986cbd ("loop: Switch to set_capacity_revalidate_and_notify()")
from v5.8-rc1 caused occasional dropping of uevent of attached or detached loop
device (not sure which one). The only difference is that
set_capacity_revalidate_and_notify() has condition:
if (capacity != size && capacity != 0 && size != 0)
thus notification is not triggered here but in a different part of code.

It was found with LTP test uevent01 [1]:

# i=0; while true; do i=$((i+1)); echo "== $i =="; rmmod -f loop; ./uevent01 || break; done

It looks to be a race. Usually ~ 10 loops is enough.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
