Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB03927AA
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 08:32:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD3903C7735
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 08:32:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F35A3C1AD6
 for <ltp@lists.linux.it>; Thu, 27 May 2021 08:32:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E66AD1401107
 for <ltp@lists.linux.it>; Thu, 27 May 2021 08:32:36 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2DD481FD2A;
 Thu, 27 May 2021 06:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622097156;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WOjTlhSIsoWZPsmA6dNxGyHXEAs6unPgpDCeLaXHVDM=;
 b=GXhWF4D2wlDZg8Y9BUNTtpGC/L7WZAkejRRrWVbTJwMYu/FS1LUzlFTIWQFQtx6/LD6Ye9
 b0v2GxO96c6MPejNIg/MkywWGRMGZ84r3llFvpYJS8DgIGzUa69r1u/j8Mva4D+ec5E0Md
 YTqlJpZ0MViRiZrRH8JVx6wNB7ztlSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622097156;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WOjTlhSIsoWZPsmA6dNxGyHXEAs6unPgpDCeLaXHVDM=;
 b=izfGfiT8uqEipt8qPT7+aGDNc8heBJTS/miuTVxLxV03Zwhfwk2dXjMpp1wKcMx2xWXmlM
 iURSrIttSaQ0PABw==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 04E2211A98;
 Thu, 27 May 2021 06:32:35 +0000 (UTC)
Date: Thu, 27 May 2021 08:32:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YK89Av7F3kML4ERn@pevik>
References: <20210526172503.18621-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526172503.18621-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [LTP PATCH v2 1/3] nfs_lib.sh: Detect unsupported protocol
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Caused by disabled CONFIG_NFSD_V[34] in kernel config.

Looking for other errno in nfs-utils (in utils/mount/):
EACCES 13 Permission denied
EAFNOSUPPORT 97 Address family not supported by protocol
EAGAIN 11 Resource temporarily unavailable
EALREADY 114 Operation already in progress
ECONNREFUSED 111 Connection refused
EINVAL 22 Invalid argument
EIO 5 Input/output error
ENOMEM 12 Cannot allocate memory
EOPNOTSUPP 95 Operation not supported
EPROTONOSUPPORT 93 Protocol not supported
ESPIPE 29 Illegal seek
ETIMEDOUT 110 Connection timed out

I suppose I should add only:
EAFNOSUPPORT 97 Address family not supported by protocol
(I guess for kernel without IPv6 support).

But doing a quick test with v3 enabled and v4 disabled:
CONFIG_NFS_V2=m
CONFIG_NFS_V3=m
# CONFIG_NFS_V3_ACL is not set
# CONFIG_NFS_V4 is not set
CONFIG_NFSD_V3=y
# CONFIG_NFSD_V3_ACL is not set
CONFIG_NFSD_V4=y

nfs-utils does not print it for enabled protocol:

nfs01 1 TINFO: setup NFSv3, socket type tcp6
nfs01 1 TINFO: Mounting NFS: mount -v -t nfs -o proto=tcp6,vers=3 [fd00:1:1:1::2]:/var/tmp/LTP_nfs01.XXXXySFHMF/3/tcp6 /var/tmp/LTP_nfs01.XXXXySFHMF/3/0
mount: mounting [fd00:1:1:1::2]:/var/tmp/LTP_nfs01.XXXXySFHMF/3/tcp6 on /var/tmp/LTP_nfs01.XXXXySFHMF/3/0 failed: Input/output error
nfs01 1 TBROK: mount command failed

but it does for disabled protocol:

nfs01 1 TINFO: setup NFSv4, socket type tcp6
nfs01 1 TINFO: Mounting NFS: mount -v -t nfs -o proto=tcp6,vers=4 [fd00:1:1:1::2]:/var/tmp/LTP_nfs01.XXXXWyckxh/4/tcp6 /var/tmp/LTP_nfs01.XXXXWyckxh/4/0
NFS: NFSv4 is not compiled into kernel
mount: mounting [fd00:1:1:1::2]:/var/tmp/LTP_nfs01.XXXXWyckxh/4/tcp6 on /var/tmp/LTP_nfs01.XXXXWyckxh/4/0 failed: Protocol not supported
mount: mounting [fd00:1:1:1::2]:/var/tmp/LTP_nfs01.XXXXWyckxh/4/tcp6 on /var/tmp/LTP_nfs01.XXXXWyckxh/4/0 failed: Protocol not supported
nfs01 1 TCONF: Protocol not supported

It might be a problem with LTP tst_net.sh library, which might not support
disabled IPv6 properly. Testing ping02.sh -6:

ping02 1 TINFO: initialize 'lhost' 'ltp_ns_veth2' interface
ping02 1 TINFO: add local addr 10.0.0.2/24
ping02 1 TINFO: add local addr fd00:1:1:1::2/64
RTNETLINK answers: Operation not supported
ping02 1 TINFO: initialize 'rhost' 'ltp_ns_veth1' interface
ping02 1 TINFO: add remote addr 10.0.0.1/24
ping02 1 TINFO: add remote addr fd00:1:1:1::1/64
RTNETLINK answers: Operation not supported
# tst_net_iface_prefix.c:133: TINFO: prefix and interface not found for 'fd00:1:1:1::2'.

ping02 1 TINFO: Network config (local -- remote):
ping02 1 TINFO: ltp_ns_veth2 -- ltp_ns_veth1
ping02 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24
ping02 1 TINFO: fd00:1:1:1::2/64 -- fd00:1:1:1::1/64
ping02 1 TINFO: timeout per run is 0h 5m 0s
ping6: socket: Address family not supported by protocol
ping02 1 TFAIL: ping6 -I ltp_ns_veth2 -c 3 -s 8 -f -p 000102030405060708090a0b0c0d0e0f fd00:1:1:1::1 >/dev/null failed unexpectedly

=> It's not a priority, I'll try to have look into it in when time permits.
https://github.com/linux-test-project/ltp/issues/821

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
