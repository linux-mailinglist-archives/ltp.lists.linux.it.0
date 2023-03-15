Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9496BA467
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 01:56:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AAD23CD514
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 01:56:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA5683CB843
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 01:56:43 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 03D3C600095
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 01:56:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B2452189A;
 Wed, 15 Mar 2023 00:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678841801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IkDyPJvyQcXmy8sXhlvn6nX3buBBDpVILlvmQsZEK4A=;
 b=gmZpOo4RP7CIkdruMyRvUXZ/+kJ4uUkr7Ji8Omw1exsTDj6eehTHcV+nS59sSQZAsBcNr1
 HxaNCCYZsMV4RyUN6MlxpCu+Oh99byPJkJ7auiFpXBC2Yl46DXs1/pJv8KQARPEF4ywxwk
 B4fp/0Ty/roin7DoRlaSwXwbyqoZwQg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75B2713A26;
 Wed, 15 Mar 2023 00:56:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JOCEE8gXEWRHUgAAMHmgww
 (envelope-from <wegao@suse.com>); Wed, 15 Mar 2023 00:56:40 +0000
Date: Tue, 14 Mar 2023 20:56:37 -0400
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20230315005637.GB18639@localhost>
References: <20230309145917.26846-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230309145917.26846-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ns_ifmove.c: Rewrite to new API
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Mar 09, 2023 at 03:59:17PM +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/containers/share/ns_ifmove.c | 98 ++++++-------------
>  1 file changed, 28 insertions(+), 70 deletions(-)
> 
>  	int intf_index, pid, rtnetlink_socket;
>  
>  	if (argc != 3) {
> -		tst_resm(TINFO, "%s <INTERFACE_NAME> <NAMESPACE_PID>",
> -			 argv[0]);
> +		printf("ns_ifmove <INTERFACE_NAME> <NAMESPACE_PID>\n");
>  		return 1;
>  	}
>  
should we use tst_res(TINFO) instead of printf?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
