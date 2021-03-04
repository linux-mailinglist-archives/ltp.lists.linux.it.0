Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8D32D839
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 18:02:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E89753C6E3E
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 18:02:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A29403C565E
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 18:02:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D3217600F46
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 18:02:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFE07AB8C;
 Thu,  4 Mar 2021 17:02:04 +0000 (UTC)
Date: Thu, 4 Mar 2021 18:02:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YEESix61jnGdJ4P/@pevik>
References: <YD0NapQGu/HEi5HK@pevik>
 <89a20590-e81c-4959-f7d7-da95e6423107@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89a20590-e81c-4959-f7d7-da95e6423107@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 URI_NOVOWEL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] NFS tests failure: RPC: Couldn't create auth handle
 (flavor 390004)
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

> > I'm looking to some NFS failures on recent openSUSE kernel 5.11.

> > "RPC:       Couldn't create auth handle (flavor 390004)" error has something to
> > do with krb5i, but module rpcsec_gss_krb5 is loaded.

Hi Alexey,

> Hi Petr,

> Do other security flavours work well, or without them using "none" opt?
> Also 'sys' is not default in your setup? If it doesn't work just for
> krb5 it might be some misconfiguration with kerberos setup there...

thanks for a tip. No, define sec=... in /etc/nfsmount.conf does not help.

* Adding sec=sys into /etc/nfsmount.conf leads to (or keeping the default):
nfs01 1 TINFO: Mounting NFS: mount -t nfs -o proto=tcp,vers=4.1 10.0.0.2:/tmp/LTP_nfs01.nM6Epvvg20/4.1/tcp /tmp/LTP_nfs01.nM6Epvvg20/4.1/0
mount.nfs: mounting 10.0.0.2:/tmp/LTP_nfs01.nM6Epvvg20/4.1/tcp failed, reason given by server: No such file or directory
nfs01 1 TBROK: mount command failed

* sec=none
nfs01 1 TINFO: setup NFSv4.1, socket type tcp
nfs01 1 TINFO: Mounting NFS: mount -t nfs -o proto=tcp,vers=4.1 10.0.0.2:/tmp/LTP_nfs01.pCXxr8Cr0I/4.1/tcp /tmp/LTP_nfs01.pCXxr8Cr0I/4.1/0
mount.nfs: Operation not permitted

* sec=krb5 or sec=krb5i or sec=krb5p
nfs01 1 TINFO: setup NFSv4.1, socket type tcp
nfs01 1 TINFO: Mounting NFS: mount -t nfs -o proto=tcp,vers=4.1 10.0.0.2:/tmp/LTP_nfs01.9oZybEIlye/4.1/tcp /tmp/LTP_nfs01.9oZybEIlye/4.1/0
mount.nfs: an incorrect mount option was specified

I have to dig more into the docs.

BTW what services are required to be running for NFS tests?
I have running: proc-fs-nfsd.mount, var-lib-nfs-rpc_pipefs.mount, nfs-idmapd.service, nfs-mountd.service, nfs-server.service, nfsdcld.servicenfs-client.target.

Kind regards,
Petr

> > Any idea what could cause "nfs41_sequence_process: Error 0 free the slot"
> > and "NFS reply lookup: -2"?

> > Kind regards,
> > Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
