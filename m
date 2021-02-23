Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C93233CE
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 23:38:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF1673C60E8
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 23:38:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9AC053C2BEF
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 23:38:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CDE662005E0
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 23:38:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22E00ACE5;
 Tue, 23 Feb 2021 22:38:53 +0000 (UTC)
Date: Tue, 23 Feb 2021 23:38:51 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <YDWD+9dB8kx0ZPYR@pevik>
References: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
 <20200928035605.22701-2-tusharsu@linux.microsoft.com>
 <20201221230531.GD4453@pevik>
 <28c14c80-660a-0f36-64ca-ae5230992032@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28c14c80-660a-0f36-64ca-ae5230992032@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] IMA: generalize key measurement tests
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
Cc: snitzer@redhat.com, nramas@linux.microsoft.com, dm-devel@redhat.com,
 ltp@lists.linux.it, linux-integrity@vger.kernel.org, gmazyland@gmail.com,
 agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tushar,

> Thanks for your review.
> My sincere apologies for missing this email and not responding in time.

> The device mapper measurement work is being revisited - to cover aspects
> like more DM targets (not just dm-crypt), better memory management,
> more relevant attributes from the DM targets, other corner cases etc.

> Therefore, even though this patch, "1/2: generalize key measurement
> tests", would be useful for other tests; I will have to revisit the
> second patch, "2/2: dm-crypt measurements", to address the DM side changes I
> mentioned above.

> I will revisit this series, esp. testing the DM target measurements
> part, once the kernel work I mentioned above is close to completion.

> I will also address your feedback on patch #1 and #2 from v2 iteration
> at that time.

> Thanks again for your review and feedback.

I updated your patchset a bit and going to send it to ML.

Kind regards,
Petr

> Thanks,
> Tushar

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
