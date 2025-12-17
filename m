Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC9CC656F
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Dec 2025 08:12:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A90D53D03A1
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Dec 2025 08:12:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D517A3D0395
 for <ltp@lists.linux.it>; Wed, 17 Dec 2025 08:12:14 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3C3CD60004A
 for <ltp@lists.linux.it>; Wed, 17 Dec 2025 08:12:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95C5C336C5;
 Wed, 17 Dec 2025 07:12:07 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 817323EA63;
 Wed, 17 Dec 2025 07:12:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4m/NHsdXQmkaaAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 17 Dec 2025 07:12:07 +0000
Date: Wed, 17 Dec 2025 08:12:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20251217071206.GB34230@pevik>
References: <20251216173053.29112-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216173053.29112-1-mdoucha@suse.cz>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 95C5C336C5
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] cpuset_memory: Print basic subtest
 descriptions
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

Hi Martin,

> The cpuset_memory tests has multiple subtests. Print short description
> before each subtest to simplify debugging. The last three subtests
> have the same description because they differ only in the specific
> pattern of signals sent to the parent and child allocator threads.

Yeah, it makes sense as ith has 17 tests.

...
>  test16()
>  {
> +	tst_resm TINFO "Testing anonymous memory reallocation in multiple cpusets with threads and migration."

How about using $1 to print number of the test (on each message, not on the last
three)?
nit: Also, could we remove the trailing dot?

tst_resm TINFO "$1 Testing anonymous memory reallocation in multiple cpusets with threads and migration"

If you agree I can do both before merge.

Kind regards,
Petr

>  	cpuset_set "$CPUSET/1" "$cpu_of_node0" "1" "0" 2> $CPUSET_TMP/stderr
>  	if [ $? -ne 0 ]; then
>  		cpuset_log_error $CPUSET_TMP/stderr
> @@ -688,6 +704,7 @@ test16()

>  test17()
>  {
> +	tst_resm TINFO "Testing anonymous memory reallocation in multiple cpusets with threads and migration."
>  	cpuset_set "$CPUSET/1" "$cpu_of_node0" "1" "0" 2> $CPUSET_TMP/stderr
>  	if [ $? -ne 0 ]; then
>  		cpuset_log_error $CPUSET_TMP/stderr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
