Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 780763C9E10
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 13:58:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 281433C74DD
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 13:58:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4CF363C6158
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 13:58:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BD04410011AA
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 13:58:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 197BE1FE16;
 Thu, 15 Jul 2021 11:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626350287;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cie8rMVXcLiJm5iiQ9cOTmcM+TgUX4kk0Xi2nhNplSw=;
 b=QBQfkEv7GtsDbahW+41JyMRVpNIHB3WsNMp3lzxXyUMPK2f+AIN76Dvmg3gGvTSt/wunNo
 nu+foRbC1tQK47wCA/TrHp09KAiz0Ndlih9ctElGKDDU6P1wDcC0AvLBtiDV61J7d2sbfg
 wc7HTaPU4ZZ6yiRGeJDw0Tk69P+1lXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626350287;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cie8rMVXcLiJm5iiQ9cOTmcM+TgUX4kk0Xi2nhNplSw=;
 b=s/m+ONNSzJiE8lhgpfElhFVkINr4p6uxe4v74djKLdPC4jqnOsONffrND/9R7+QBISvuZC
 FAypUuWvl3pUH/DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5D7013C32;
 Thu, 15 Jul 2021 11:58:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jYN7Ms4i8GBGNQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 11:58:06 +0000
Date: Thu, 15 Jul 2021 13:58:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YPAizWCKXQHQOSBv@pevik>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <77583f09-e378-c39e-8ca2-6bf77adbda52@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77583f09-e378-c39e-8ca2-6bf77adbda52@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,LOTS_OF_MONEY,MONEY_NOHTML,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] Add TST_NET_IPV{4,
 6}_ONLY and use on broken_ip
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

> On 14.07.2021 17:07, Petr Vorel wrote:
> > Hi Alexey,

> > https://github.com/linux-test-project/ltp/issues/843

> > does it make sense to run it on IPv4 and broken_ip-totlen on IPv6?
> > Both don't break but not in runtest file.

> Hi Petr,

> Yes it should work with the -L option, but these tests are the same
> (differs the descriptions for IPv4/IPv6):

> diff -u broken_ip-plen broken_ip-totlen
> --- broken_ip-plen	2020-10-08 22:23:52.000000000 +0300
> +++ broken_ip-totlen	2020-10-08 22:23:52.000000000 +0300
> @@ -10,7 +10,7 @@

>  do_test()
>  {
> -	tst_res TINFO "Sending ICMPv$TST_IPVER with wrong payload len for $NS_DURATION sec"
> +	tst_res TINFO "Sending ICMPv$TST_IPVER with wrong total len field for $NS_DURATION sec"
>  	tst_icmp -t $NS_DURATION -s "0 100 500 1000 $NS_ICMP_SENDER_DATA_MAXSIZE" -L
>  	tst_ping
>  }

Good catch, thanks!

> So broken_ip-totlen should be just removed.
I merged commit which implements this.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
