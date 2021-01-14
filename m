Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E372F6369
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 15:47:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F8723C6A65
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 15:47:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DB0AE3C3183
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 15:47:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0D68F1000D5C
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 15:47:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CA1AACAD;
 Thu, 14 Jan 2021 14:47:46 +0000 (UTC)
Date: Thu, 14 Jan 2021 15:47:44 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YABZkHIQmDUnKFZF@pevik>
References: <20210107120247.31465-1-pvorel@suse.cz>
 <d7eba485-08db-1cc7-abe6-38d23c244bfb@oracle.com>
 <X/7+vk6WsJ2LDJlC@pevik>
 <dced71df-28f6-056e-9518-338cccce4c11@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dced71df-28f6-056e-9518-338cccce4c11@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Lower CHANGE_INTERVAL to 1
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> Hi Petr,

> Do you mean "sleep $NS_DURATION" in mcast-pktfld02.sh is not needed
Yes: sleep $NS_DURATION in mcast-pktfld02.sh and other mcast*.sh tests in:
https://patchwork.ozlabs.org/project/ltp/patch/20201125053459.3314021-2-lkml@jv-coder.de/
https://patchwork.ozlabs.org/project/ltp/patch/20201125053459.3314021-1-lkml@jv-coder.de/

> or something else?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
