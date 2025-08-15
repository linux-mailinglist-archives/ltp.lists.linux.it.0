Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123EB299B4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Aug 2025 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1755498679; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=2RFDvd1vXgjzmeLiwAkeVDHC5lQzOBFqo/ytBUoMJoE=;
 b=VyTzFKAAksmCcXUDyzkLJYe4YUM4E7qOqAmv8Tn7J47whdwQkL20qLdNdcrmSafC3CWNF
 QZ/BSeEpm2n9ghjBdvECf4G2YiZKocmeJ++5mpRgKwULv4BA7TIVc4WEVDLtgwUV7YsE+sT
 5kNuV/I5AWEuCth0tFGFcVtaB0N0u0g=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3564D3CC93F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Aug 2025 08:31:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 002A13C9F6C
 for <ltp@lists.linux.it>; Fri, 15 Aug 2025 18:24:09 +0200 (CEST)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3D0EE6002CF
 for <ltp@lists.linux.it>; Fri, 15 Aug 2025 18:24:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 212E1419C9;
 Fri, 15 Aug 2025 16:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B60C4CEEB;
 Fri, 15 Aug 2025 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755275045;
 bh=4W3MexmDLIj0LLuVBsUoXVIfys/oLMGtURiFQUEH13U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nUphFxrWKV+6n7KpkD3VVRbo27xzyyN/vWebfUiwoAS3RvQSWcpYef5mbG32vq0xD
 Hj0/e3bePcSFamI9nK1ma1Z1tJgmnKrGZNeX7nNEd7c2k/TECv6Usta5G6k2J1kTXq
 LsLm0KSBqNf5NIpDJGBe/pMGF4IRBd7RfiQ0AFAHXmAiB/AdFCFFEAZWTG5KJ1UEeH
 gx7uzJLw+iJTkPJ6nbo75iUvpli22kP4Ea4eVzyFa0QL+rwrRi3uUMsyrZOzUynbnX
 vzx4mQ8pLbKA4C23C8MVuQVsKobT/zIxnc9HN1TNS3GmfWQ6VfTQjsBHkx+jBmRUuP
 bmqcMI4Wr142Q==
Date: Fri, 15 Aug 2025 09:24:01 -0700
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <aJ9fIUkM04HhRgSR@google.com>
References: <20250812173419.303046420@linuxfoundation.org>
 <CA+G9fYtBnCSa2zkaCn-oZKYz8jz5FZj0HS7DjSfMeamq3AXqNg@mail.gmail.com>
 <2025081300-frown-sketch-f5bd@gregkh> <aJ5EupUV9t0jToY3@google.com>
 <2025081536-resonate-wafer-6699@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025081536-resonate-wafer-6699@gregkh>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 18 Aug 2025 08:29:56 +0200
Subject: Re: [LTP] [PATCH 6.16 000/627] 6.16.1-rc1 review
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
From: Namhyung Kim via ltp <ltp@lists.linux.it>
Reply-To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Jan Kara <jack@suse.cz>,
 qemu-devel@nongnu.org, lkft-triage@lists.linaro.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, hargar@microsoft.com,
 Dan Carpenter <dan.carpenter@linaro.org>, f.fainelli@gmail.com,
 shuah@kernel.org, jonathanh@nvidia.com, Joseph Qi <jiangqi903@gmail.com>,
 patches@kernelci.org, linux-ext4 <linux-ext4@vger.kernel.org>,
 linux@roeck-us.net, Arnd Bergmann <arnd@arndb.de>, srw@sladewatkins.net,
 broonie@kernel.org, Ben Copeland <benjamin.copeland@linaro.org>,
 LTP List <ltp@lists.linux.it>, rwarsow@gmx.de, pavel@denx.de,
 patches@lists.linux.dev, conor@kernel.org, linux-perf-users@vger.kernel.org,
 Zhang Yi <yi.zhang@huaweicloud.com>, achill@achill.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, sudipm.mukherjee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 15, 2025 at 07:33:41AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 14, 2025 at 01:19:06PM -0700, Namhyung Kim wrote:
> > Hello,
> > 
> > Thanks for the report!
> > 
> > On Wed, Aug 13, 2025 at 02:50:49PM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Aug 13, 2025 at 05:46:26PM +0530, Naresh Kamboju wrote:
> > > > Long story:
> > > > 1)
> > > > The perf gcc-13 build failed on x86_64 and i386.
> > > > 
> > > > Build regression: qemu-arm64 ARM64_64K_PAGES ltp syscalls swap fsync
> > > > fallocate failed.
> > > > 
> > > > > Ian Rogers <irogers@google.com>
> > > > >     perf topdown: Use attribute to see an event is a topdown metic or slots
> > > > 
> > > > Build error:
> > > > 
> > > > arch/x86/tests/topdown.c: In function 'event_cb':
> > > > arch/x86/tests/topdown.c:53:25: error: implicit declaration of
> > > > function 'pr_debug' [-Werror=implicit-function-declaration]
> > > >    53 |                         pr_debug("Broken topdown information
> > > > for '%s'\n", evsel__name(evsel));
> > > >       |                         ^~~~~~~~
> > > > cc1: all warnings being treated as errors
> > > 
> > > Already fixed.
> > 
> > Are you sure?  I'm not seeing the fix.  Can you share the commit id?
> 
> I dropped the offending perf patch:
> 	https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/commit/?id=4199b872a5585e025f62886724f4f9ae80e014ae
> 
> Did that not work for you?

Oh sorry, I misunderstood you.  I thought you have a fix.

Thanks,
Namhyung


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
