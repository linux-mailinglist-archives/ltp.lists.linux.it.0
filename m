Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8368EC47
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 11:04:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 183EB3CC15E
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 11:04:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F27B03C9339
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 11:04:05 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 181D11000233
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 11:04:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E23D820A66;
 Wed,  8 Feb 2023 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1675850643;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TOEh4JcgMnXRLdclogTt1KKqb84qt04ZIY9LD5VKTDk=;
 b=0BAadx1uEPVUTJFzbG2W4NKgT90ing5bQaa4CW4s0xzZAZLVcxa9dnwZumjzUUH3J0vxGf
 LwahVCI2gS7Ejd/vCTve7ujt+3GR+HuHaPV/5CJOuHblL2qf9ygO0ulx2tR/955FTnI0CX
 6ZDGur8YLICNPfEslpplm/OSl3Yfrng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1675850643;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TOEh4JcgMnXRLdclogTt1KKqb84qt04ZIY9LD5VKTDk=;
 b=t8OVaxOD0RIe3BlEz8ktKa+1cHPPSzfXE3/VchNUjNDS+98dY1mHi8XElGpCufjH3fCx//
 M4RwIwnddbwep8Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3EA913425;
 Wed,  8 Feb 2023 10:04:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0Aj1LZNz42NxKQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 08 Feb 2023 10:04:03 +0000
Date: Wed, 8 Feb 2023 11:04:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <Y+NzkUcAyeupRwmP@pevik>
References: <20230208092327.28914-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208092327.28914-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] testscripts/network.sh: Don't load tst_net.sh
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

> This should not be needed any more for neither new API and legacy tests
> since 04021637f4 ("tst_test.sh: Cleanup getopts usage")
I suppose loading tst_net.sh was not needed even before. I wonder why this was
ever needed.

It was added in 6538f7ab70 ("network: merge networktests.sh/networkstress.sh
into network.sh") when testcases/lib/test_net.sh (predecessor of
testcases/lib/tst_net.sh) was much simpler (e.g. without netns).

I suppose it was due export LTP_RSH=${LTP_RSH:-"rsh -n"} which was moved from
testscripts/network.sh to testcases/lib/test_net.sh.

LTP_RSH was changed to use ssh internally in 40110018e6 ("tst_net.sh: Remove rsh
support"), but the variable is still used in various legacy files, which don't
even use tst_net.sh. But these files aren't in any runtest file (see below),
therefore it should be safe to merge this.

$ for i in $(git grep -l LTP_RSH |grep -v README); do j=$(basename $i); echo "* $j ($i)"; git grep $j runtest/; done
* tst_net.sh (testcases/lib/tst_net.sh)
* icmp4-multi-diffip01 (testcases/network/stress/icmp/multi-diffip/icmp4-multi-diffip01)
* icmp4-multi-diffnic01 (testcases/network/stress/icmp/multi-diffnic/icmp4-multi-diffnic01)
* add_ipv6addr (testcases/network/stress/ns-tools/add_ipv6addr)
* check_envval (testcases/network/stress/ns-tools/check_envval)
* check_netem (testcases/network/stress/ns-tools/check_netem)
* check_setkey (testcases/network/stress/ns-tools/check_setkey)
* get_ifname (testcases/network/stress/ns-tools/get_ifname)
* initialize_if (testcases/network/stress/ns-tools/initialize_if)
* killall_icmp_traffic (testcases/network/stress/ns-tools/killall_icmp_traffic)
* killall_tcp_traffic (testcases/network/stress/ns-tools/killall_tcp_traffic)
* killall_udp_traffic (testcases/network/stress/ns-tools/killall_udp_traffic)
* set_ipv4addr (testcases/network/stress/ns-tools/set_ipv4addr)
* tcp4-multi-diffip01 (testcases/network/stress/tcp/multi-diffip/tcp4-multi-diffip01)
* tcp4-multi-diffnic01 (testcases/network/stress/tcp/multi-diffnic/tcp4-multi-diffnic01)
* tcp4-multi-diffport01 (testcases/network/stress/tcp/multi-diffport/tcp4-multi-diffport01)
* tcp4-multi-sameport01 (testcases/network/stress/tcp/multi-sameport/tcp4-multi-sameport01)
* tcp4-uni-basic01 (testcases/network/stress/tcp/uni-basic/tcp4-uni-basic01)
* udp4-multi-diffip01 (testcases/network/stress/udp/multi-diffip/udp4-multi-diffip01)
* udp4-multi-diffnic01 (testcases/network/stress/udp/multi-diffnic/udp4-multi-diffnic01)
* udp4-multi-diffport01 (testcases/network/stress/udp/multi-diffport/udp4-multi-diffport01)
* udp4-uni-basic01 (testcases/network/stress/udp/uni-basic/udp4-uni-basic01)

Tools in testcases/network/stress/ns-tools/ will be removed once the rest of
testcases/network/stress/{icmp,udp}/ is migrated to use tst_net.sh or removed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
