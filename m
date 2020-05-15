Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC81D45C7
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 08:22:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B3573C53B8
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 08:22:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3FE843C5399
 for <ltp@lists.linux.it>; Fri, 15 May 2020 08:22:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8387F10018AD
 for <ltp@lists.linux.it>; Fri, 15 May 2020 08:22:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DBC7AC12;
 Fri, 15 May 2020 06:22:25 +0000 (UTC)
Date: Fri, 15 May 2020 08:22:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200515062221.GB5117@dell5510>
References: <20200514190906.27130-1-pvorel@suse.cz>
 <CAEemH2e5G53VPLp4bOe_i-2_4eRSF9dbTC378rqN-AwGanUTEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e5G53VPLp4bOe_i-2_4eRSF9dbTC378rqN-AwGanUTEw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] INSTALL: Update requirements
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

thanks for your review!

> As we know most distributions provide the requirements packages already,
> so I'm thinking if we can replace the download link only by installing
> commands, that will make people easily prepare their test environment.

> Which something maybe likes:
> --------------------------------------

> +       #### Debian/Ubuntu
> +       ```
> +       sudo apt-get install make
> +       sudo apt-get install pkgconf
> +       sudo apt-get install autoconf
> +       sudo apt-get install automake
> +       sudo apt-get install byacc
> +       sudo apt-get install flex
> +       sudo apt-get install m4
> +       ```
Maybe this:

Debian / Ubuntu
# apt install gcc make pkgconf autoconf automake bison flex m4 linux-headers-$(uname -r) libc6-dev

OpenSUSE / SLES
# zypper install gcc make pkgconf autoconf automake bison flex m4 linux-glibc-devel glibc-devel

Fedora / CentOS / RHEL
# yum install gcc make pkgconf autoconf automake bison flex m4 kernel-headers glibc-headers

I'd prefer it in simple form (single line) + I thought bison is more common than
byacc (but maybe I'm wrong). I'm not a big fan of sudo (but can add it there).
+ Added headers and gcc. But on the other hand I wanted to have package reference in
travis/*.sh (where are missing some packages which are installed by default with
gcc, e.g. , but it does not harm to have it offline.

Should I remove links to the tools? And we obviously don't list a compiler.

> +
> +       #### OpenSUSE
> +       ```
> +       sudo zypper install make
> +       sudo zypper install pkgconf
> +       sudo zypper install autoconf
> +       sudo zypper install automake
> +       sudo zypper install byacc
> +       sudo zypper install flex
> +       sudo zypper install m4
> +       ```
> +       #### Fedora/CentOS/RHEL
> +       ```
> +       sudo yum install make
> +       sudo yum install pkgconf
> +       sudo yum install autoconf
> +       sudo yum install automake
> +       sudo yum install byacc
> +       sudo yum install flex
> +       sudo yum install m4
> +       ```

> Anyway, this is a good update for documents, I hope these could be involved
> in the newly released.
> [CC Cyril to notice this]
Yep, that was the intention of this late evening patches :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
