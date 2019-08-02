Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFD7F7AF
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 15:00:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AB773C207D
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 15:00:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9A3BE3C2029
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 14:59:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 92A29600865
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 15:00:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E998AD85;
 Fri,  2 Aug 2019 12:59:57 +0000 (UTC)
Date: Fri, 2 Aug 2019 14:59:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20190802125955.GA707@dell5510>
References: <20190725111027.18716-1-pvorel@suse.cz>
 <20190725111027.18716-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725111027.18716-4-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/5] network/route: Rewrite route-change-dst
 into new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> * Drop route command (use just ip command), support both IPv4 and IPv6
> * Add route-lib.sh (will be used in other route-change-*)
> * Use unused network range to avoid clash with real network
> * Add verification with ping (previous version sent UDP datagram with
> ns-udpsender, but didn't verify receiving it on rhost and didn't setup
> rhost ip at all)

> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  runtest/net_stress.route                      |   4 +-
>  .../network/stress/route/00_Descriptions.txt  |  18 +-
>  .../network/stress/route/route-change-dst     |  33 +++
>  testcases/network/stress/route/route-lib.sh   |  17 ++
>  .../network/stress/route/route4-change-dst    | 276 ------------------
>  .../network/stress/route/route6-change-dst    | 272 -----------------
>  6 files changed, 55 insertions(+), 565 deletions(-)
>  create mode 100755 testcases/network/stress/route/route-change-dst
Just a small change, not worth of sending v2: use .sh extension
for all 3 tests (route-change-{dst,gw,if}.sh).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
