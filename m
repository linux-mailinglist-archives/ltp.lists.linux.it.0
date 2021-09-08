Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B96403655
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 10:50:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40ED23C9190
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 10:50:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1E483C222D
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 10:50:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BF3C710011AA
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 10:50:00 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D00AE1FD2D;
 Wed,  8 Sep 2021 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631090999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lh8VNLMuvevp2QJZue+gkUW0QXTwVrBMNproJ8y+Oqw=;
 b=otIb9XR7ESfOmgXskioc2Vz/UmBRoPfZ6aJ64HhF07/KYbk8STkuPyrSMeP56natHTCo0/
 zSw4bXikE5kS1qEgwg9S9b7IgX4TOqw7XJVdfASQAvwVqLhJ8LY6Mc5jvtOeJLbzXDxe2f
 OGRmHLkqu7Y7YGn5ZvPIPUH6hv+WII8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631090999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lh8VNLMuvevp2QJZue+gkUW0QXTwVrBMNproJ8y+Oqw=;
 b=kl8FFvx0efWAKPKnA1bn2ifo9pRzGLyvCgNS/+nL+s4u/zznTbhdzpKsMnc7Rq+ffUzO6t
 VXbyl+0JCeuocaCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B9A4C13A64;
 Wed,  8 Sep 2021 08:49:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 7tRCLDd5OGFrWgAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Wed, 08 Sep 2021 08:49:59 +0000
Message-ID: <5b7f4a92-983f-2a7b-21f3-f9e2110bc0c2@suse.cz>
Date: Wed, 8 Sep 2021 10:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Content-Language: en-US
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>,
 Cyril Hrubis <chrubis@suse.cz>
References: <1630897958-2160-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <613864D4.5030400@fujitsu.com>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <613864D4.5030400@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] runtest/cve: Fix wrong cve tag
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08. 09. 21 9:22, xuyang2018.jy@fujitsu.com wrote:
> Hi Cyril, Martin
> 
> In fact, Look the following url:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3609
> 
> It said nothing and seems this cve number doesn't exist.
> 
> Do you know what happen?

This vulnerability is tracked under this CVE number in SUSE Bugzilla and
RedHat security portal:
https://bugzilla.suse.com/show_bug.cgi?id=1187215
https://access.redhat.com/security/cve/cve-2021-3609

I didn't check any "upstream" CVE databases.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
