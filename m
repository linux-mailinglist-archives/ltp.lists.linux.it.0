Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE834403826
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 12:44:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D3373C91A1
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 12:44:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 921A73C2266
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 12:44:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8A05B1A0037B
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 12:44:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C8882012D;
 Wed,  8 Sep 2021 10:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631097884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilkbXsSXeAtUWjI1lMOqfQQC2bLHEBQrANTfjxeMmd0=;
 b=zs3SBFIRaSAR4yhPQixRSqlY6L0tcva2fxMYCFbCQNfU2pFilG01pQB0VhnggMeWRCF3kq
 ntA+msyn84/NyOZDwRB0UQavAikIHrrGy/VXSDfpzJIXXeh6N0Lc+KVIABHpA/fX8GZZVE
 bh4py7lDXJM3ZDafP5PMKXSOaffisdg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631097884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilkbXsSXeAtUWjI1lMOqfQQC2bLHEBQrANTfjxeMmd0=;
 b=rUEseFpdGX24muwFvCYKhdUYv6W/YDS4ePt1ZKcEOJWLvEmFMPZwGTMgTtb9Q66exu7+pf
 2mUkYZ9Ac9VQe0AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C0A613CC6;
 Wed,  8 Sep 2021 10:44:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UMifFRyUOGFpTQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 08 Sep 2021 10:44:44 +0000
Date: Wed, 8 Sep 2021 12:44:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YTiUKRnhWh6b6iS9@yuki>
References: <1630897958-2160-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <613864D4.5030400@fujitsu.com>
 <5b7f4a92-983f-2a7b-21f3-f9e2110bc0c2@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b7f4a92-983f-2a7b-21f3-f9e2110bc0c2@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

Hi!
> > In fact, Look the following url:
> > https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3609
> > 
> > It said nothing and seems this cve number doesn't exist.
> > 
> > Do you know what happen?
> 
> This vulnerability is tracked under this CVE number in SUSE Bugzilla and
> RedHat security portal:
> https://bugzilla.suse.com/show_bug.cgi?id=1187215
> https://access.redhat.com/security/cve/cve-2021-3609
> 
> I didn't check any "upstream" CVE databases.

Looks like the CVE has been allocated though, so possibly somehow the
the notification that it has been assigned has failed. I guess that
RedHat security team should look into this.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
