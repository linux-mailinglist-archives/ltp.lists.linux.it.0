Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 394611FD590
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 21:52:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB3E33C2CDA
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 21:52:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3F08A3C2CB5
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 21:52:15 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D83D91A00CC6
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 21:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592423533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bd/UhXF5PAw+f2+fDN6TaGxb76Zt213SNjoeRalON8Y=;
 b=gcX9jSEYxaTwR18FX3WDrLh6nROUShZYKr81bIZC/qwKzj19bzjY9FvtAntn9B/YHrfsR+
 h2M2f/ucyl5iFAzaq09GrW8AoE4a42B+gwk2qsqaRF2jpJz85S3PSLY5LBGe+DhyeqzcZM
 uxpDcNrLiWyUXsAjXRa1Xez730flJvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-brOrSKgoP_u90wN5XWqslw-1; Wed, 17 Jun 2020 15:52:08 -0400
X-MC-Unique: brOrSKgoP_u90wN5XWqslw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E668E8035CD;
 Wed, 17 Jun 2020 19:52:06 +0000 (UTC)
Received: from localhost (ovpn-116-72.gru2.redhat.com [10.97.116.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DAC119D9E;
 Wed, 17 Jun 2020 19:52:06 +0000 (UTC)
Date: Wed, 17 Jun 2020 16:52:05 -0300
From: Bruno Meneguele <bmeneg@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200617195205.GA40831@glitch>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com>
 <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com>
 <20200528160527.GA27243@dell5510> <20200615194134.GF129694@glitch>
 <20200615200121.GG129694@glitch>
 <1592347211.11061.250.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1592347211.11061.250.camel@linux.ibm.com>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=get&search=0x3823031E4660608D
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [LTP v2 1/1] ima_tpm.sh: Fix for calculating boot
 aggregate
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
Cc: Vitaly Chikunov <vt@altlinux.org>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0167733325=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0167733325==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 06:40:11PM -0400, Mimi Zohar wrote:
> On Mon, 2020-06-15 at 17:01 -0300, Bruno Meneguele wrote:
> > On Mon, Jun 15, 2020 at 04:41:34PM -0300, Bruno Meneguele wrote:
> > > On Thu, May 28, 2020 at 06:05:27PM +0200, Petr Vorel wrote:
>=20
> > > > > The boot_aggregate.trs and boot_aggregate.log files are being cre=
ated
> > > > > in the tests/ directory. =A0Is that directory read-only?
> > > > Yes, drwxr-xr-x. Testing on fresh clone and issue persists.
> > > >=20
> > >=20
> > > Yes, same thing here.. but didn't really check the reason for that. W=
ill
> > > take a time later to see what's happening.
>=20
> Cloning as root will cause that to happen.
>=20
> $ sudo git clone git://git.code.sf.net/p/linux-ima/ima-evm-utils --branch=
 next-testing
> Cloning into 'ima-evm-utils'...
> remote: Enumerating objects: 1154, done.
> remote: Counting objects: 100% (1154/1154), done.
> remote: Compressing objects: 100% (1052/1052), done.
> remote: Total 1154 (delta 736), reused 182 (delta 96)
> Receiving objects: 100% (1154/1154), 335.12 KiB | 0 bytes/s, done.
> Resolving deltas: 100% (736/736), done.
> Checking connectivity... done.
>=20
> $ ls -lat ima-evm-utils/ | grep tests
> drwxr-xr-x.  2 root root   220 Jun 16 18:28 tests
>=20
> Mimi
>=20

Yes, indeed. But what really happened with both I and Petr was trying to
run the test copying and pasting what you've sent:

$ VERBOSE=3D1 make check TESTS=3Dboog_aggregate.test

the typo in "boog" (vs "boot") was the cause. So I think we can ignore
this issue here :).

--=20
bmeneg=20
PGP Key: http://bmeneg.com/pubkey.txt

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEdWo6nTbnZdbDmXutYdRkFR+RokMFAl7qdGUACgkQYdRkFR+R
okOslwgAyxmw5vJJroe8Iyxb/U9Xs3a5FsoQUorNAqNNaxJaGYyA7uS+QD4FiWzn
4ZYAj32AFJcr5YdMQ7zhqxoLaere280klcxb8rLjdAvH9Z6N3hnwHdgvzM2DQbGB
VMwGKSa+WQT/fIJJNCc+qXs3kB9NGRpqTyfMNn2DiQqtUZCp+vn+KwknY/xa+cVR
oriVaBGWWNtrBTPQCD/D9L6l0aJOEsHByQl5hrGHGgG27pfoqYul5ChWBk/SIKBL
TsSlOb16EKsElBP4j/GyHHRz1ZByj66KgzCXwSMaAQXjWFLyVVgP7V52EXD31Vgp
YbCl9R8PFXDqsmXmyN5AjBOfygr6Gw==
=t10N
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--


--===============0167733325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0167733325==--

