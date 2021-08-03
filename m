Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEB3DF19F
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:37:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B44A23C88BB
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:37:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7187D3C5535
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:37:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 802986008B8
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:37:49 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5FBB621639;
 Tue,  3 Aug 2021 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628005068;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kfOBodmLqzckQXQTFrkelZmnSyC8c9JnQbQu3Uabe6Q=;
 b=vB8k9CwFh2JppjQyPlhMl9ynpv3lFsjaPAfT+MMcqupnRdzpuRreGfoMaVmlOnKxKoqS2f
 PjhtyE0luQG/JsEcxHgYL7WEVOxTPaUs54n+PD/FBO3pq7kyCgsm5Vt11QlflP65NxhIn4
 UvRtm15hk6hQ36fNS1wLzb4TfuiZOuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628005068;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kfOBodmLqzckQXQTFrkelZmnSyC8c9JnQbQu3Uabe6Q=;
 b=r0cGVmsf07Ft/ye4yRFq3B6ur3e70ZcVTII1Jc2hRrENsamT4WjEsTlvidJz5hE9H8KCyE
 9kOl+iKbQGU2HVDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 32ADE13B68;
 Tue,  3 Aug 2021 15:37:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mws4CsxiCWGbegAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 03 Aug 2021 15:37:48 +0000
Date: Tue, 3 Aug 2021 17:37:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YQliykiyDtJwEKVK@pevik>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
 <YQBD4w2nKwY2G1l+@pevik>
 <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com>
 <YQg0LIXG8LK0OV74@pevik>
 <80a6cbec-50b7-9912-d682-915a1076bbec@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80a6cbec-50b7-9912-d682-915a1076bbec@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,LOTS_OF_MONEY,MONEY_NOHTML,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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
> On 02.08.2021 21:06, Petr Vorel wrote:
> > Hi Alexey,

> >> Hi Petr,
> >> On 27.07.2021 20:35, Petr Vorel wrote:
> >>> Hi Alexey,

> >>>> On 14.07.2021 17:07, Petr Vorel wrote:
> >>>>> net_stress.broken_ip runtest file is correct, but some users try to run
> >>>>> tests manually.

> >>>>> Fixes: #843

> >> ...
> >>>>>  do_test()

> >>>> The generic version looks fine:

> >>>> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

> >>> I didn't understand whether you'd prefer to add TST_IPV6=6 (or TST_IPV6=) where
> >>> needed or accept this patchset. Both would work.

> >> I think for manual runs it is better to set TST_IPV6=6 in the test
> >> so it will run the test rather the require passing some options.
> > It looks like specifying TST_IPV6=6 is not enough, because tests are using
> > $NS_ICMP_SENDER_DATA_MAXSIZE which is defined in tst_net.sh according to
> > TST_IPV6. We can

> > 1) overwrite NS_ICMP_SENDER_DATA_MAXSIZE="$NS_ICMPV6_SENDER_DATA_MAXSIZE"
> > 2) check TST_IPV6 before running tst_net_parse_args and if set overwrite -6 flag

> > But both are quite ugly, thus unless you have better idea I merge this patchset.


> Are you sure that you are getting the wrong maxsize? if TST_IPV6=6
> is set before the setup, in the test, why tst_net_setup() is setting
> the IPv4 value?

The problem is actually in IPv6, ns-icmpv6_sender does not support -c.
IPv6 only is only broken_ip-ihl tests, the other 4 are IPv4 only.
I tested variables after loading tst_net.sh, but that was later overwritten with
getopt -6. But setting it in the test function works (you probably meant this).
I still don't like having to specify 2 variables (yes both are needed), but it's
not a big deal thus I'll merge this version.

Kind regards,
Petr

--- testcases/network/stress/broken_ip/broken_ip-checksum
+++ testcases/network/stress/broken_ip/broken_ip-checksum
@@ -10,7 +10,10 @@ TST_TESTFUNC="do_test"
 
 do_test()
 {
-	tst_res TINFO "Sending ICMPv$TST_IPVER with wrong chksum field for $NS_DURATION sec"
+	TST_IPV6=
+	TST_IPVER=4
+
+	tst_res TINFO "Sending ICMPv4 with wrong chksum field for $NS_DURATION sec"
 	tst_icmp -t $NS_DURATION -s "0 100 500 1000 $NS_ICMP_SENDER_DATA_MAXSIZE" -c
 	tst_ping
 }


> > Kind regards,
> > Petr

> >>> Kind regards,
> >>> Petr




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
