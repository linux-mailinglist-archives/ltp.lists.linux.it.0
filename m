Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD13A7880
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 09:52:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 977493C4CF0
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 09:52:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D46B3C0B9A
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 09:52:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 08456600667
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 09:52:13 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7DB761FD56
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623743533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tpAd0+J+8ZMPVKDVnR7iE+pvX9DSFtag3T43bBwzisA=;
 b=qh7qdxIK19G83tkZ7Z8PXfXJlay5fTE7UQ0tNMTnf5EEHcLfOVzkDzWmwC2V5NSCnRwrg3
 jqJY8xxAvFGs//+s1PG2EQcL0bWgN0Mb6V91IX3Bvx6Oc4JLxLmy+9DArOGimuQprjwbT2
 kHp/+me6J4R9E824IpEtyyw50QRC8iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623743533;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tpAd0+J+8ZMPVKDVnR7iE+pvX9DSFtag3T43bBwzisA=;
 b=bgx6k5CVmRac8McWx7uWtGrkw9xTP7RszyTSFVJ/noLY6XakchjOF0Tjy91F6QE0EVvnlX
 2niJWF8TkRZmt5BQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5A4F4118DD
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623743533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tpAd0+J+8ZMPVKDVnR7iE+pvX9DSFtag3T43bBwzisA=;
 b=qh7qdxIK19G83tkZ7Z8PXfXJlay5fTE7UQ0tNMTnf5EEHcLfOVzkDzWmwC2V5NSCnRwrg3
 jqJY8xxAvFGs//+s1PG2EQcL0bWgN0Mb6V91IX3Bvx6Oc4JLxLmy+9DArOGimuQprjwbT2
 kHp/+me6J4R9E824IpEtyyw50QRC8iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623743533;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tpAd0+J+8ZMPVKDVnR7iE+pvX9DSFtag3T43bBwzisA=;
 b=bgx6k5CVmRac8McWx7uWtGrkw9xTP7RszyTSFVJ/noLY6XakchjOF0Tjy91F6QE0EVvnlX
 2niJWF8TkRZmt5BQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id GfbGEy1cyGClQgAALh3uQQ (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 07:52:13 +0000
Date: Tue, 15 Jun 2021 09:26:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YMhWJw3GBwh+TBwB@yuki>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] IRC moved to libera.chat
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
This is just heads up that I've registered #ltp channel on libera.chat
and moved there. I was looking if we have the original channel
advertised somewhere on our pages but I haven't found anythings, so
maybe we should advertise it somewhere now.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
